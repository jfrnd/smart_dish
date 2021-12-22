import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dish/domain/core/failure.dart';

part 'auth_failure.freezed.dart';

@freezed
class AuthFailure extends Failure with _$AuthFailure {
  const factory AuthFailure.unknown(String msg) = Unknown;
  const factory AuthFailure.invalidEmail(String msg) = InvalidEmail;
  const factory AuthFailure.wrongPassword(String msg) = WrongPassword;
  const factory AuthFailure.weakPassword(String msg) = WeakPassword;
  const factory AuthFailure.emailAlreadyInUse(String msg) = EmailAlreadyInUse;
  const factory AuthFailure.requiresRecentLogin(String msg) =
      RequiresRecentLogin;
  const factory AuthFailure.userNotFound(String msg) = UserNotFound;
  const factory AuthFailure.userDisabled(String msg) = UserDisabled;
  const factory AuthFailure.operationNotAllowed(String msg) =
      OperationNotAllowed;
  const factory AuthFailure.tooManyRequests(String msg) = TooManyRequests;
  const factory AuthFailure.invalidEmailAndPasswordCombination() =
      InvalidEmailAndPasswordCombination;
  const factory AuthFailure.notSignedIn() = NotSignedIn;
  const factory AuthFailure.passwordsDoNotMatch() = PasswordsDoNotMatch;
  const factory AuthFailure.emailNotVerified() = EmailNotVerified;
}

extension FirebaseExceptionX on FirebaseException {
  AuthFailure toCrudFailure() {
    switch (code) {
      case "invalid.email":
        return AuthFailure.invalidEmail(message ?? code.toString());
      case "wrong-password":
        return AuthFailure.wrongPassword(message ?? code.toString());
      case "weak-password":
        return AuthFailure.weakPassword(message ?? code.toString());
      case "email-already-in-use":
        return AuthFailure.emailAlreadyInUse(message ?? code.toString());
      case "requires-recent-login":
        return AuthFailure.requiresRecentLogin(message ?? code.toString());
      case "user-not-Found":
        return AuthFailure.userNotFound(message ?? code.toString());
      case "user-disabled":
        return AuthFailure.userDisabled(message ?? code.toString());
      case "operation-not-allowed":
        return AuthFailure.operationNotAllowed(message ?? code.toString());
      case "too-many-requests":
        return AuthFailure.tooManyRequests(message ?? code.toString());
      default:
        return AuthFailure.unknown(message ?? "Unknown error occured.");
    }
  }
}
