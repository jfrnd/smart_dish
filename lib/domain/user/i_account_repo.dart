import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

import 'package:smart_dish/auth/i_auth_repo.dart';
import 'package:smart_dish/domain/core/crud_failure.dart';

import 'package:rxdart/rxdart.dart';
import 'package:smart_dish/domain/user/user.dart';
import 'package:smart_dish/domain/watcher/i_watcher_repo.dart';
import 'package:smart_dish/utils/logger.dart';

// ignore: constant_identifier_names
const USER_IMAGE = "userImage";

abstract class IAccountRepo implements IWatcherRepo<User> {
  Stream<Either<CrudFailure, User>> watchSignedInUser();
  Future<Either<CrudFailure, Unit>> updateUserName(String newUserName);
  Future<Either<CrudFailure, Unit>> updateUserPic(Uint8List image);
}

@LazySingleton(as: IAccountRepo)
class FirebaseAccountRepo implements IAccountRepo {
  final IAuthRepo _authRepo;
  final FirebaseFirestore _fs;
  final FirebaseFunctions _functions;
  final FirebaseStorage _storage;

  FirebaseAccountRepo(this._authRepo, this._fs, this._functions, this._storage);

  @override
  Stream<Either<CrudFailure, User>> watchAll() async* {
    yield* watchSignedInUser();
  }

  @override
  Stream<Either<CrudFailure, User>> watchSignedInUser() async* {
    final uid = await _authRepo.getUserId();

    yield* CombineLatestStream.combine2(
      _fs
          .collection(USERS)
          .doc(uid)
          .withConverter<User>(
            fromFirestore: (snapshot, _) => User.fromFirestore(snapshot, _),
            toFirestore: (user, _) => user.toFirestore(_),
          )
          .snapshots()
          .map(
        (snapshot) {
          if (!snapshot.exists) {
            return left<CrudFailure, User>(const CrudFailure.doesNotExist());
          } else {
            return right<CrudFailure, User>(snapshot.data()!);
          }
        },
      ),
      _authRepo.watchEmailAddress(),
      (Either<CrudFailure, User> fOrUser, String email) {
        final Either<CrudFailure, User> failureOrUser = fOrUser.fold(
            (crudFailure) => left(crudFailure),
            (user) => right(user.copyWith(email: email)));
        return failureOrUser;
      },
    ).onErrorReturnWith(
      (e, stackTrace) {
        if (e is FirebaseException) {
          return left(
            CrudFailure.firebase(e.message ?? "Unknown error."),
          );
        } else {
          return left(CrudFailure.unknown(e.toString()));
        }
      },
    );
  }

  @override
  Future<Either<CrudFailure, Unit>> updateUserName(String newUserName) async {
    try {
      final callable = _functions.httpsCallable('userDoc-updateUserName');
      await callable({USER_NAME: newUserName});
      return right(unit);
    } on FirebaseException catch (e) {
      logger.d(e.message);
      return left(CrudFailure.firebase(e.message ?? "Unknown error."));
    }
  }

  @override
  Future<Either<CrudFailure, Unit>> updateUserPic(Uint8List image) async {
    final uid = await _authRepo.getUserId();
    try {
      await _storage
          .ref()
          .child(uid)
          .child(USER_IMAGE)
          .putData(image, SettableMetadata(contentType: "image/jpeg"));

      final imageUrl =
          await _storage.ref().child(uid).child(USER_IMAGE).getDownloadURL();

      await _fs.collection(USERS).doc(uid).update({
        IMAGE_URL: imageUrl,
      });

      return const Right(unit);
    } on FirebaseException catch (e) {
      logger.d(e.message);
      return left(CrudFailure.firebase(e.message ?? "Unknown error."));
    }
  }
}
