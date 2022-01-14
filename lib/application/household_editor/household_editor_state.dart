part of 'household_editor_cubit.dart';

@freezed
class HouseholdEditorState with _$HouseholdEditorState {
  const factory HouseholdEditorState({
    required bool isLoading,
    required bool isCreatingNewHousehold,
    required bool isInEditMode,
    required bool hasPermissionToUpdate,
    required bool isCreator,
    required bool showErrorMessages,
    required List<User> membersPool,
    required Either<CrudFailure, Unit>? failureOrSuccess,
    required Household household,
    required Uint8List? image,
  }) = _Initial;

  factory HouseholdEditorState.initial() => HouseholdEditorState(
        isLoading: false,
        isCreatingNewHousehold: false,
        isInEditMode: false,
        isCreator: false,
        hasPermissionToUpdate: false,
        showErrorMessages: false,
        failureOrSuccess: null,
        membersPool: [],
        household: Household.empty(),
        image: null,
      );
}
