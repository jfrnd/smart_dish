part of 'dish_editor_cubit.dart';

@freezed
class DishEditorState with _$DishEditorState {
  const factory DishEditorState({
    required bool isLoading,
    required bool isUpdating,
    required bool showErrorMessages,
    required Either<CrudFailure, Unit>? failureOrSuccess,
    required Dish dish,
    required Uint8List? image,
  }) = _Initial;

  factory DishEditorState.initial() => DishEditorState(
        isLoading: false,
        isUpdating: false,
        showErrorMessages: false,
        failureOrSuccess: null,
        dish: Dish.empty(),
        image: null,
      );
}
