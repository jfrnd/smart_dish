import 'package:flutter/material.dart';
import 'package:smart_dish/auth/auth_failure.dart';

import 'crud_failure.dart';

class Failure {}

extension FailureX on Failure {
  String toMessage() {
    if (this is CrudFailure) {
      return (this as CrudFailure).map(
        firebase: (failure) => failure.info,
        doesNotExist: (failure) => "Does not exist.",
        stillLoading: (failure) => "Still loading.",
      );
    } else if (this is AuthFailure) {
      return (this as AuthFailure).map(
        weakPassword: (_) => "Please choose a stronger password.",
        operationNotAllowed: (_) => "This Sign-in-Method is not activated.",
        userDisabled: (_) => "Account was disabled. Please contact support.",
        requiresRecentLogin: (_) =>
            "This is a security-sensitive operation. Please log in again.",
        userNotFound: (_) => "User not found.",
        invalidEmail: (_) => "Email address is invalid.",
        wrongPassword: (_) => "Wrong Password.",
        emailNotVerified: (_) => "Email not verified yet.",
        serverError: (_) => "Unexpected server error occured.",
        emailAlreadyInUse: (_) => "Email address already in use.",
        invalidEmailAndPasswordCombination: (_) =>
            "Email and/or password are wrong.",
        passwordsDoNotMatch: (_) => "Passwords do not match.",
        notSignedIn: (_) => "Not signed in.",
        tooManyRequests: (_) => "Too many requests.",
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
