part of 'dish_editor_cubit.dart';

@freezed
class DishEditorState with _$DishEditorState {
  const factory DishEditorState({
    required bool isLoading,
    required bool isCreatingNewDish,
    required bool isInEditMode,
    required bool hasPermissionToUpdate,
    required bool showErrorMessages,
    required Either<CrudFailure, Unit>? failureOrSuccess,
    required Dish dish,
    required Uint8List? image,
  }) = _Initial;

  factory DishEditorState.initial() => DishEditorState(
        isLoading: false,
        isCreatingNewDish: false,
        isInEditMode: false,
        hasPermissionToUpdate: false,
        showErrorMessages: false,
        failureOrSuccess: null,
        dish: Dish.empty(),
        image: null,
      );
}
