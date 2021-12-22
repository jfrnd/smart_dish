import 'package:flutter/material.dart';
import 'package:smart_dish/auth/auth_failure.dart';

import 'crud_failure.dart';

class Failure {}

extension FailureX on Failure {
  String toMessage() {
    if (this is CrudFailure) {
      return (this as CrudFailure).map(
          stillLoading: (f) => "Still loading",
          unknown: (f) => f.msg,
          cancelled: (f) => f.msg,
          aborted: (f) => f.msg,
          dataLoss: (f) => f.msg,
          alreadyExists: (f) => f.msg,
          deadlineExceeded: (f) => f.msg,
          failedPrecondition: (f) => f.msg,
          internal: (f) => f.msg,
          invalidArgument: (f) => f.msg,
          notFound: (f) => f.msg,
          ok: (f) => f.msg,
          outOfRange: (f) => f.msg,
          permissionDenied: (f) => f.msg,
          resourceExhausted: (f) => f.msg,
          unauthenticated: (f) => f.msg,
          unavailable: (f) => f.msg,
          unimplemented: (f) => f.msg);
    } else if (this is AuthFailure) {
      return (this as AuthFailure).map(
        unknown: (f) => f.msg,
        weakPassword: (f) => f.msg,
        operationNotAllowed: (f) => f.msg,
        userDisabled: (f) => f.msg,
        requiresRecentLogin: (f) => f.msg,
        userNotFound: (f) => f.msg,
        invalidEmail: (f) => f.msg,
        tooManyRequests: (f) => f.msg,
        wrongPassword: (f) => f.msg,
        emailAlreadyInUse: (f) => f.msg,
        invalidEmailAndPasswordCombination: (_) =>
            "Email and/or password are wrong.",
        passwordsDoNotMatch: (_) => "Passwords do not match.",
        notSignedIn: (_) => "User not signed in.",
        emailNotVerified: (_) => "Email not verified.",
      );
    } else {
      return "Failure.";
    }
  }

  void showError(BuildContext context, bool isWeb) => isWeb
      ? showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: ListTile(
              leading: const Icon(Icons.error, color: Colors.red),
              title: Text(toMessage()),
            ),
          ),
        )
      : ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: ListTile(
              leading: const Icon(Icons.error, color: Colors.red),
              title: Text(
                toMessage(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
}
