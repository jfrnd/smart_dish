import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_dish/domain/core/crud_failure.dart';
import 'package:smart_dish/domain/dish/dish.dart';
import 'package:smart_dish/domain/dish/i_dish_repo.dart';

part 'dish_editor_state.dart';
part 'dish_editor_cubit.freezed.dart';

@injectable
class DishEditorCubit extends Cubit<DishEditorState> {
  final IDishRepo _repo;
  final ImagePicker _imagePicker;

  DishEditorCubit(this._repo, this._imagePicker)
      : super(DishEditorState.initial());

  void initialized(Dish? dish) {
    if (dish != null) {
      emit(
        state.copyWith(
          dish: dish,
          isUpdating: true,
        ),
      );
    }
  }

  void dishNameChanged(String value) => emit(
        state.copyWith(
          dish: state.dish.copyWith(name: value),
        ),
      );

  Future<void> onChangePictureClicked() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final image = await pickedFile.readAsBytes();

      emit(
        state.copyWith(
          image: image,
        ),
      );
    }
  }

  Future<void> onNewImageLoaded(Uint8List image) async {
    emit(
      state.copyWith(
        image: image,
      ),
    );
  }

  Future<void> onSavedClicked() async {
    if (!state.isLoading) {
      emit(
        state.copyWith(
          showErrorMessages: true,
        ),
      );

      final dish = state.dish;
      final image = state.image;

      if (dish.name.isNotEmpty) {
        emit(
          state.copyWith(
            isLoading: true,
            failureOrSuccess: null,
          ),
        );

        if (state.isUpdating) {
          await _repo.updateDish(dish, image).then(
                (failureOrSuccess) => failureOrSuccess.fold(
                  (failure) => emit(
                    state.copyWith(
                      failureOrSuccess: left(failure),
                      isLoading: false,
                    ),
                  ),
                  (success) => emit(
                    state.copyWith(
                      failureOrSuccess: right(unit),
                      isLoading: false,
                    ),
                  ),
                ),
              );
        } else {
          await _repo.createDish(dish, image).then(
                (failureOrSuccess) => failureOrSuccess.fold(
                  (failure) => emit(
                    state.copyWith(
                      failureOrSuccess: left(failure),
                      isLoading: false,
                    ),
                  ),
                  (success) => emit(
                    state.copyWith(
                      failureOrSuccess: right(unit),
                      isLoading: false,
                    ),
                  ),
                ),
              );
        }
      }
    }
  }

  Future<void> ondeletedDishClicked() async {
    emit(state.copyWith(isLoading: true));
    final dish = state.dish;

    await _repo.deleteDish(dish).then(
          (failureOrSuccess) => failureOrSuccess.fold(
            (failure) => emit(
              state.copyWith(
                failureOrSuccess: left(failure),
                isLoading: false,
              ),
            ),
            (success) => emit(
              state.copyWith(
                failureOrSuccess: right(unit),
                isLoading: false,
              ),
            ),
          ),
        );
  }
}
