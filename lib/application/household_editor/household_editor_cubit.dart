import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_dish/application/watcher/friend_watcher_cubit.dart';
import 'package:smart_dish/application/watcher/signed_in_user_watcher_cubit.dart';
import 'package:smart_dish/domain/core/crud_failure.dart';
import 'package:smart_dish/domain/household/household.dart';
import 'package:smart_dish/domain/household/i_household_repo.dart';
import 'package:smart_dish/domain/user/user.dart';

part 'household_editor_state.dart';
part 'household_editor_cubit.freezed.dart';

@injectable
class HouseholdEditorCubit extends Cubit<HouseholdEditorState> {
  final IHouseholdRepo _repo;
  final ImagePicker _imagePicker;
  final FriendWatcherCubit friendsWatcherCubit;
  final SignedInUserWatcherCubit signedInUserWatcherCubit;

  HouseholdEditorCubit(
    this._repo,
    this._imagePicker,
    this.friendsWatcherCubit,
    this.signedInUserWatcherCubit,
  ) : super(HouseholdEditorState.initial());

  Future<void> initialized(Household? household) async {
    final signedInUser = signedInUserWatcherCubit.readSignedInUser();
    final friends = friendsWatcherCubit.readFriends();

    if (household == null) {
      emit(
        state.copyWith(
          isCreatingNewHousehold: true,
          isInEditMode: true,
          hasPermissionToUpdate: true,
          isCreator: true,
          membersPool: friends,
          household: state.household.copyWith(
            members: [signedInUser.id!],
            admins: [signedInUser.id!],
            creator: signedInUser,
          ),
        ),
      );
    }
    if (household != null && household.admins.contains(signedInUser.id!)) {
      emit(
        state.copyWith(
          household: household,
          isCreatingNewHousehold: false,
          isCreator: household.createdBy == signedInUser.id,
          hasPermissionToUpdate: true,
          membersPool: (friends + household.membersUserData)
              .whereNot((user) => user.id == signedInUser.id!)
              .toSet()
              .toList(),
        ),
      );
    }
    if (household != null && !household.admins.contains(signedInUser.id!)) {
      emit(
        state.copyWith(
          household: household,
          isCreator: household.createdBy == signedInUser.id,
          isCreatingNewHousehold: false,
          hasPermissionToUpdate: false,
          membersPool: (friends + household.membersUserData)
              .whereNot((user) => user.id == signedInUser.id!)
              .toSet()
              .toList(),
        ),
      );
    }
  }

  void memberSelected(String userId) {
    emit(
      state.copyWith(
          household: state.household.copyWith(
        members: state.household.members + [userId],
      )),
    );
  }

  void memberUnselected(String userId) {
    emit(
      state.copyWith(
        household: state.household.copyWith(
          members:
              state.household.members.whereNot((uid) => uid == userId).toList(),
          admins:
              state.household.admins.whereNot((uid) => uid == userId).toList(),
        ),
      ),
    );
  }

  void adminSelected(String userId) {
    emit(
      state.copyWith(
          household: state.household.copyWith(
        admins: state.household.admins + [userId],
        members: !state.household.members.contains(userId)
            ? state.household.members + [userId]
            : state.household.members,
      )),
    );
  }

  void adminUnselected(String userId) {
    emit(
      state.copyWith(
        household: state.household.copyWith(
          admins:
              state.household.admins.whereNot((uid) => uid == userId).toList(),
        ),
      ),
    );
  }

  void editModeSwitched() => state.isInEditMode
      ? emit(
          state.copyWith(isInEditMode: false),
        )
      : emit(
          state.copyWith(isInEditMode: true),
        );

  void householdNameChanged(String value) => emit(
        state.copyWith(
          household: state.household.copyWith(name: value),
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

      final household = state.household;
      final image = state.image;

      if (household.name.isNotEmpty) {
        emit(
          state.copyWith(
            isLoading: true,
            failureOrSuccess: null,
          ),
        );

        if (state.isCreatingNewHousehold) {
          await _repo.createHousehold(household, image).then(
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
          await _repo.updateHousehold(household, image).then(
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

  Future<void> onDeletedHouseholdClicked() async {
    emit(state.copyWith(isLoading: true));
    final household = state.household;

    await _repo.deleteHousehold(household).then(
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
