import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_dish/auth/i_auth_repo.dart';
import 'package:smart_dish/domain/core/crud_failure.dart';
import 'package:smart_dish/domain/dish/dish.dart';
import 'package:smart_dish/domain/dish/i_dish_repo.dart';
import 'package:smart_dish/domain/dish/ingredient.dart';

part 'dish_editor_state.dart';
part 'dish_editor_cubit.freezed.dart';

@injectable
class DishEditorCubit extends Cubit<DishEditorState> {
  final IDishRepo _repo;
  final ImagePicker _imagePicker;
  final IAuthRepo _authRepo;

  DishEditorCubit(this._repo, this._imagePicker, this._authRepo)
      : super(DishEditorState.initial());

  Future<void> initialized(Dish? dish) async {
    final userId = await _authRepo.getUserId();

    if (dish == null) {
      emit(
        state.copyWith(
          isCreatingNewDish: true,
          isInEditMode: true,
          hasPermissionToUpdate: true,
        ),
      );
    }
    if (dish != null && dish.createdBy == userId) {
      emit(
        state.copyWith(
          dish: dish,
          isCreatingNewDish: false,
          hasPermissionToUpdate: true,
        ),
      );
    }
    if (dish != null && dish.createdBy != userId) {
      emit(
        state.copyWith(
          dish: dish,
          isCreatingNewDish: false,
          hasPermissionToUpdate: false,
        ),
      );
    }
  }

  void editModeSwitched() => state.isInEditMode
      ? emit(
          state.copyWith(isInEditMode: false),
        )
      : emit(
          state.copyWith(isInEditMode: true),
        );

  void toggleIngredientCheck(bool value, Ingredient ingredient) => emit(
        state.copyWith(
          dish: state.dish.copyWith(
            ingredients: state.dish.ingredients
                .map((i) => i.localId != ingredient.localId
                    ? i
                    : i.copyWith(isChecked: value))
                .toList(),
          ),
        ),
      );

  void dishNameChanged(String value) => emit(
        state.copyWith(
          dish: state.dish.copyWith(name: value),
        ),
      );

  void onAddNewIngredientClicked() {
    emit(
      state.copyWith(
        dish: state.dish.copyWith(
            ingredients: state.dish.ingredients + [Ingredient.empty()]),
      ),
    );
  }

  void onOrderIngredientsChanged(List<Ingredient> ingredients) => emit(
        state.copyWith(
          dish: state.dish.copyWith(
            ingredients: ingredients,
          ),
        ),
      );

  void onIngredientChanged(int index, String name) => emit(
        state.copyWith(
          dish: state.dish.copyWith(
              ingredients: state.dish.ingredients
                  .mapIndexed((idx, ingr) =>
                      idx == index ? ingr.copyWith(name: name) : ingr)
                  .toList()),
        ),
      );

  void onDeleteIngredientClicked(int index) => emit(
        state.copyWith(
          dish: state.dish.copyWith(
            ingredients: state.dish.ingredients
                .whereIndexed((idx, _) => idx != index)
                .toList(),
          ),
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

        if (state.isCreatingNewDish) {
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
        } else {
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
        }
      }
    }
  }

  Future<void> onDeletedDishClicked() async {
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
