import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_dish/domain/user/user.dart';
import 'package:smart_dish/utils/logger.dart';

import 'auth_failure.dart';

class NotAuthenticatedError extends Error {}

abstract class IAuthRepo {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<AuthFailure, Unit>> reauthenticateWithCredential({
    required String password,
  });

  Future<Either<AuthFailure, Unit>> updateToken();
  Future<Either<AuthFailure, Unit>> removeToken();

  Future<Either<AuthFailure, Unit>> updatePassword({
    required String newPassword,
  });

  Future<Either<AuthFailure, Unit>> updateEmail({
    required String newEmail,
  });

  Future<Either<AuthFailure, Unit>> resetPassword({
    required String email,
  });

  Stream<String> watchEmailAddress();

  Future<String> getUserId();

  Stream<Either<AuthFailure, Unit>> watchUserState();

  Future<Either<AuthFailure, Unit>> getEmailVerificationState();

  void manuallyReloadUser();

  Future<void> signOut();

  Future<Either<AuthFailure, Unit>> deleteAccount();
}

@LazySingleton(as: IAuthRepo)
class FirebaseAuthRepo implements IAuthRepo {
  final fba.FirebaseAuth _firebaseAuth;
  final FirebaseMessaging _messaging;
  final FirebaseFirestore _fs;
  Timer? timer;

  FirebaseAuthRepo(this._firebaseAuth, this._messaging, this._fs);

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final actionCodeSettings = fba.ActionCodeSettings(
        url: 'https://smartdish-82118.web.app/#/home-page',
        handleCodeInApp: false,
      );

      final token = await _messaging.getToken();

      await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then(
            (value) => _firebaseAuth.currentUser
                ?.sendEmailVerification(actionCodeSettings),
          );

      return right(unit);
    } on fba.FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return left(const AuthFailure.emailAlreadyInUse());
      } else if (e.code == 'invalid-email') {
        return left(const AuthFailure.invalidEmail());
      } else if (e.code == 'weak-password') {
        return left(const AuthFailure.weakPassword());
      } else if (e.code == 'operation-not-allowed') {
        return left(const AuthFailure.operationNotAllowed());
      } else if (e.code == 'too-many-requests') {
        return left(const AuthFailure.tooManyRequests());
      } else {
        logger.e('Unexpected server error with ${e.code}');
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final token = await _messaging.getToken();

      if (_firebaseAuth.currentUser != null &&
          !_firebaseAuth.currentUser!.emailVerified) {
        return left(
          const AuthFailure.emailNotVerified(),
        );
      } else {
        return right(unit);
      }
    } on fba.FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password' || e.code == 'user-not-found') {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      } else if (e.code == 'user-disabled') {
        return left(const AuthFailure.userDisabled());
      } else if (e.code == 'invalid-email') {
        return left(const AuthFailure.invalidEmail());
      } else if (e.code == 'too-many-requests') {
        return left(const AuthFailure.tooManyRequests());
      } else {
        logger.e('Unexpected server error with ${e.code}');
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> resetPassword(
      {required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(
        email: email,
      );
      return right(unit);
    } on fba.FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left(const AuthFailure.userNotFound());
      } else if (e.code == 'invalid-email') {
        return left(const AuthFailure.invalidEmail());
      } else if (e.code == 'too-many-requests') {
        return left(const AuthFailure.tooManyRequests());
      } else {
        logger.e('Unexpected server error with ${e.code}');
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<String> getUserId() async {
    final firebaseUser = _firebaseAuth.currentUser;
    await firebaseUser?.reload();
    if (firebaseUser == null) throw NotAuthenticatedError();
    return firebaseUser.uid;
  }

  @override
  Future<Either<AuthFailure, Unit>> getEmailVerificationState() async {
    final firebaseUser = _firebaseAuth.currentUser;
    await firebaseUser?.reload();
    if (firebaseUser == null) return left(const AuthFailure.notSignedIn());
    if (firebaseUser.emailVerified == false) {
      return left(const AuthFailure.emailNotVerified());
    }
    return right(unit);
  }

  @override
  void manuallyReloadUser() async {
    final firebaseUser = _firebaseAuth.currentUser;
    await firebaseUser?.reload();
  }

  @override
  Stream<Either<AuthFailure, Unit>> watchUserState() async* {
    yield* _firebaseAuth.userChanges().map(
      (firebaseUser) {
        if (firebaseUser == null) {
          return left(const AuthFailure.notSignedIn());
        }
        if (firebaseUser.emailVerified == false) {
          return left(const AuthFailure.emailNotVerified());
        } else {
          return right(unit);
        }
      },
    );
  }

  @override
  Future<void> signOut() async {
    await removeToken();
    _firebaseAuth.signOut();
  }

  @override
  Future<Either<AuthFailure, Unit>> deleteAccount() async {
    try {
      await _firebaseAuth.currentUser?.delete();
      return right(unit);
    } on fba.FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        return left(const AuthFailure.requiresRecentLogin());
      } else if (e.code == 'too-many-requests') {
        return left(const AuthFailure.tooManyRequests());
      } else {
        logger.e('Unexpected server error with ${e.code}');
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> updatePassword({
    required String newPassword,
  }) async {
    try {
      if (_firebaseAuth.currentUser == null) {
        return left(const AuthFailure.notSignedIn());
      }
      await _firebaseAuth.currentUser!.updatePassword(newPassword);
      return right(unit);
    } on fba.FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        return left(const AuthFailure.requiresRecentLogin());
      } else if (e.code == 'weak-password') {
        return left(const AuthFailure.weakPassword());
      } else if (e.code == 'too-many-requests') {
        return left(const AuthFailure.tooManyRequests());
      } else {
        logger.e('Unexpected server error with ${e.code}');
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> reauthenticateWithCredential(
      {required String password}) async {
    try {
      if (_firebaseAuth.currentUser?.email == null) {
        return left(const AuthFailure.notSignedIn());
      }

      final email = _firebaseAuth.currentUser!.email!;

      fba.AuthCredential credential = fba.EmailAuthProvider.credential(
        email: email,
        password: password,
      );

      await _firebaseAuth.currentUser?.reauthenticateWithCredential(credential);
      return right(unit);
    } on fba.FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        return left(const AuthFailure.wrongPassword());
      } else if (e.code == 'too-many-requests') {
        return left(const AuthFailure.tooManyRequests());
      } else {
        logger.e('Unexpected server error with ${e.code}');
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> updateEmail({
    required String newEmail,
  }) async {
    try {
      if (_firebaseAuth.currentUser == null) {
        return left(const AuthFailure.notSignedIn());
      }
      await _firebaseAuth.currentUser!.verifyBeforeUpdateEmail(newEmail);
      return right(unit);
    } on fba.FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        return left(const AuthFailure.requiresRecentLogin());
      } else if (e.code == 'invalid-email') {
        return left(const AuthFailure.invalidEmail());
      } else if (e.code == 'email-already-in-use') {
        return left(const AuthFailure.emailAlreadyInUse());
      } else if (e.code == 'too-many-requests') {
        return left(const AuthFailure.tooManyRequests());
      } else {
        logger.e('Unexpected server error with ${e.code}');
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Stream<String> watchEmailAddress() async* {
    yield* _firebaseAuth
        .userChanges()
        .map((firebaseUser) => firebaseUser?.email ?? "");
  }

  @override
  Future<Either<AuthFailure, Unit>> updateToken() async {
    try {
      if (_firebaseAuth.currentUser == null) {
        return left(const AuthFailure.notSignedIn());
      }
      final userId = await getUserId();
      final token = await _messaging.getToken();

      await _fs.collection(USERS).doc(userId).set(
        {"token": token},
        SetOptions(merge: true),
      );

      return right(unit);
    } on fba.FirebaseAuthException catch (e) {
      logger.e('Unexpected server error with ${e.code}');
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> removeToken() async {
    try {
      if (_firebaseAuth.currentUser == null) {
        return left(const AuthFailure.notSignedIn());
      }
      final userId = await getUserId();

      await _fs.collection(USERS).doc(userId).set(
        {"token": ""},
        SetOptions(merge: true),
      );

      return right(unit);
    } on fba.FirebaseAuthException catch (e) {
      logger.e('Unexpected server error with ${e.code}');
      return left(const AuthFailure.serverError());
    }
  }
}
