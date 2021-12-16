import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_dish/domain/editor/editor_cubit.dart';
import 'package:smart_dish/auth/auth_failure.dart';
import 'package:smart_dish/auth/i_auth_repo.dart';

@injectable
class AuthEditorCubit extends EditorCubit {
  final IAuthRepo _authRepo;

  AuthEditorCubit(this._authRepo);

  Future<void> deletePressed() async {
    final password = state.textField1;

    emit(state.copyWith(showErrorMessages: true));

    if (password.isNotEmpty) {
      emit(
        state.copyWith(
          isSubmitting: true,
          failureOrSuccess: null,
        ),
      );

      await _authRepo.reauthenticateWithCredential(password: password).then(
            (authFailureOrSucess) => authFailureOrSucess.fold(
              (failure) => emit(
                state.copyWith(
                  isSubmitting: false,
                  failureOrSuccess: authFailureOrSucess,
                ),
              ),
              (success) => _authRepo.deleteAccount().then(
                    (authFailureOrSucess) => emit(
                      state.copyWith(
                        isSubmitting: false,
                        failureOrSuccess: authFailureOrSucess,
                      ),
                    ),
                  ),
            ),
          );
    } else {
      emit(
        state.copyWith(
          isSubmitting: false,
          failureOrSuccess: left(const AuthFailure.wrongPassword()),
        ),
      );
    }
  }

  Future<void> updateEmailPressed() async {
    final password = state.textField1;
    final newEmail = state.textField2;

    emit(state.copyWith(showErrorMessages: true));

    if (password.isNotEmpty && newEmail.isNotEmpty) {
      emit(
        state.copyWith(
          isSubmitting: true,
          failureOrSuccess: null,
        ),
      );

      await _authRepo.reauthenticateWithCredential(password: password).then(
            (authFailureOrSucess) => authFailureOrSucess.fold(
              (failure) => emit(
                state.copyWith(
                  isSubmitting: false,
                  failureOrSuccess: authFailureOrSucess,
                ),
              ),
              (success) => _authRepo.updateEmail(newEmail: newEmail).then(
                    (authFailureOrSucess) => emit(
                      state.copyWith(
                        isSubmitting: false,
                        failureOrSuccess: authFailureOrSucess,
                      ),
                    ),
                  ),
            ),
          );
    }
  }

  Future<void> changePasswordPressed() async {
    final oldPassword = state.textField1;
    final newPassword = state.textField2;
    final newPasswordConfirm = state.textField3;

    emit(state.copyWith(showErrorMessages: true));

    if (oldPassword.isNotEmpty &&
        newPassword.isNotEmpty &&
        newPassword == newPasswordConfirm) {
      emit(
        state.copyWith(
          isSubmitting: true,
          failureOrSuccess: null,
        ),
      );

      await _authRepo.reauthenticateWithCredential(password: oldPassword).then(
            (authFailureOrSucess) => authFailureOrSucess.fold(
              (failure) => emit(
                state.copyWith(
                  isSubmitting: false,
                  failureOrSuccess: authFailureOrSucess,
                ),
              ),
              (success) =>
                  _authRepo.updatePassword(newPassword: newPassword).then(
                        (authFailureOrSucess) => emit(
                          state.copyWith(
                            isSubmitting: false,
                            failureOrSuccess: authFailureOrSucess,
                          ),
                        ),
                      ),
            ),
          );
    } else if (oldPassword.isNotEmpty && newPassword != newPasswordConfirm) {
      emit(
        state.copyWith(
          failureOrSuccess: left(const AuthFailure.passwordsDoNotMatch()),
        ),
      );
    } else if (oldPassword.isEmpty) {
      emit(
        state.copyWith(
          failureOrSuccess: left(const AuthFailure.wrongPassword()),
        ),
      );
    }
  }

  Future<void> signInPressed() async {
    final email = state.textField1;
    final password = state.textField2;

    emit(state.copyWith(showErrorMessages: true));

    if (email.isNotEmpty && password.isNotEmpty) {
      await _authRepo.signOut();

      emit(
        state.copyWith(
          isSubmitting: true,
          failureOrSuccess: null,
        ),
      );

      _authRepo
          .signInWithEmailAndPassword(
            email: email.trim(),
            password: password,
          )
          .then(
            (authFailureOrSucess) => emit(
              state.copyWith(
                isSubmitting: false,
                failureOrSuccess: authFailureOrSucess,
              ),
            ),
          );
    }
  }

  Future<void> resetPasswordPressed() async {
    final email = state.textField1;

    emit(state.copyWith(showErrorMessages: true));

    if (email.isNotEmpty) {
      emit(
        state.copyWith(
          isSubmitting: true,
          failureOrSuccess: null,
        ),
      );

      _authRepo
          .resetPassword(
            email: email,
          )
          .then(
            (authFailureOrSucess) => emit(
              state.copyWith(
                isSubmitting: false,
                failureOrSuccess: authFailureOrSucess,
              ),
            ),
          );
    } else {
      emit(state.copyWith(
          failureOrSuccess: const Left(AuthFailure.invalidEmail())));
    }
  }

  Future<void> signUpPressed() async {
    final email = state.textField1;
    final password = state.textField2;
    final passwordConfirm = state.textField3;

    emit(state.copyWith(showErrorMessages: true));

    if (email.isNotEmpty &&
        password.isNotEmpty &&
        password == passwordConfirm) {
      emit(
        state.copyWith(
          isSubmitting: true,
          failureOrSuccess: null,
        ),
      );

      _authRepo
          .registerWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then(
            (authFailureOrSucess) => emit(
              state.copyWith(
                isSubmitting: false,
                failureOrSuccess: authFailureOrSucess,
              ),
            ),
          );
    }

    if (password.isNotEmpty && password != passwordConfirm) {
      emit(
        state.copyWith(
          failureOrSuccess: left(const AuthFailure.passwordsDoNotMatch()),
        ),
      );
    }
  }

  Future<void> testSignIn(String email) async {
    const password = "lol123";

    emit(
      state.copyWith(
        isSubmitting: true,
        failureOrSuccess: null,
      ),
    );

    _authRepo
        .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then(
          (authFailureOrSucess) => emit(
            state.copyWith(
              isSubmitting: false,
              failureOrSuccess: authFailureOrSucess,
            ),
          ),
        );
  }

  Future<void> testSignUp(String email) async {
    const password = "lol123";

    emit(
      state.copyWith(
        isSubmitting: true,
        failureOrSuccess: null,
      ),
    );

    _authRepo
        .registerWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then(
          (authFailureOrSucess) => emit(
            state.copyWith(
              isSubmitting: false,
              failureOrSuccess: authFailureOrSucess,
            ),
          ),
        );
  }
}
