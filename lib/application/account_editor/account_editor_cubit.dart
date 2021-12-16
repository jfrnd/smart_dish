import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_dish/domain/editor/editor_cubit.dart';
import 'package:smart_dish/domain/user/i_account_repo.dart';
import 'package:image_picker/image_picker.dart';

@injectable
class AccountEditorCubit extends EditorCubit {
  final IAccountRepo _accountRepo;
  final ImagePicker _imagePicker;

  AccountEditorCubit(this._accountRepo, this._imagePicker);

  Future<void> updateUserNamePressed() async {
    final userName = state.textField1;

    emit(state.copyWith(showErrorMessages: true));

    if (userName.isNotEmpty) {
      emit(
        state.copyWith(
          isSubmitting: true,
          failureOrSuccess: null,
        ),
      );

      await _accountRepo.updateUserName(userName).then(
            (failureOrUnit) => failureOrUnit.fold(
              (failure) => emit(
                state.copyWith(
                  isSubmitting: false,
                  failureOrSuccess: left(failure),
                ),
              ),
              (r) => emit(
                state.copyWith(
                  isSubmitting: false,
                  failureOrSuccess: right(unit),
                ),
              ),
            ),
          );
    }
  }

  Future<void> updateUserPic(Uint8List image) async {
    // final pickedFile =
    //     await _imagePicker.pickImage(source: ImageSource.gallery);

    // if (pickedFile != null) {
    emit(state.copyWith(isSubmitting: true));

    await _accountRepo.updateUserPic(image).then(
          (failureOrUnit) => failureOrUnit.fold(
            (failure) => emit(
              state.copyWith(
                failureOrSuccess: left(failure),
                isSubmitting: false,
              ),
            ),
            (string) => emit(
              state.copyWith(
                failureOrSuccess: right(unit),
                isSubmitting: false,
              ),
            ),
          ),
        );
    // }
  }
}
