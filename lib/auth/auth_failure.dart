import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dish/domain/core/failure.dart';

part 'auth_failure.freezed.dart';

@freezed
class AuthFailure extends Failure with _$AuthFailure {
  const factory AuthFailure.serverError() = ServerError;
  const factory AuthFailure.invalidEmail() = InvalidEmail;
  const factory AuthFailure.wrongPassword() = WrongPassword;
  const factory AuthFailure.weakPassword() = WeakPassword;
  const factory AuthFailure.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory AuthFailure.emailNotVerified() = EmailNotVerified;
  const factory AuthFailure.requiresRecentLogin() = RequiresRecentLogin;
  const factory AuthFailure.userNotFound() = UserNotFound;
  const factory AuthFailure.userDisabled() = UserDisabled;
  const factory AuthFailure.operationNotAllowed() = OperationNotAllowed;
  const factory AuthFailure.invalidEmailAndPasswordCombination() =
      InvalidEmailAndPasswordCombination;
  const factory AuthFailure.passwordsDoNotMatch() = PasswordsDoNotMatch;
  const factory AuthFailure.notSignedIn() = NotSignedIn;
  const factory AuthFailure.tooManyRequests() = TooManyRequests;
}
