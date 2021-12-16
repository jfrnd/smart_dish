part of 'editor_cubit.dart';

@freezed
class EditorState with _$EditorState {
  const factory EditorState({
    required String textField1,
    required String textField2,
    required String textField3,
    required String textField4,
    required String textField5,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Either<Failure, Unit>? failureOrSuccess,
  }) = _EditorState;

  factory EditorState.initial() => const EditorState(
        textField1: "",
        textField2: "",
        textField3: "",
        textField4: "",
        textField5: "",
        showErrorMessages: false,
        isSubmitting: false,
        failureOrSuccess: null,
      );
}
