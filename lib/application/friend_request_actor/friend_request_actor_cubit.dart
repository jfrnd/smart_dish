import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:smart_dish/domain/core/crud_failure.dart';
import 'package:smart_dish/domain/friend_request/i_friend_request_repo.dart';
import 'package:smart_dish/domain/user/user.dart';

part 'friend_request_actor_cubit.freezed.dart';
part 'friend_request_actor_state.dart';

@injectable
class FriendRequestActorCubit extends Cubit<FriendRequestActorState> {
  FriendRequestActorCubit(
    this._repo,
  ) : super(const FriendRequestActorState.initial());

  final IFriendRequestRepo _repo;

  Future<void> onSendFriendRequestClicked(User user) async {
    emit(const FriendRequestActorState.isLoading());

    await _repo.sendFriendRequest(user).then(
          (failureOrUnit) => failureOrUnit.fold(
            (failure) => emit(FriendRequestActorState.actionFailed(failure)),
            (success) =>
                emit(const FriendRequestActorState.requestSentSuccess()),
          ),
        );
  }

  Future<void> onDeleteFriend(User user) async {
    emit(const FriendRequestActorState.isLoading());

    await _repo.deleteFriend(user.id!).then(
          (failureOrUnit) => failureOrUnit.fold(
            (failure) => emit(FriendRequestActorState.actionFailed(failure)),
            (success) =>
                emit(const FriendRequestActorState.friendDeleteSuccess()),
          ),
        );
  }

  Future<void> onConfirmRequestClicked(String requestId) async {
    if (state is _Initial || state is _ActionFailed) {
      emit(FriendRequestActorState.isConfirming(requestId));

      await _repo.confirmFriendRequest(requestId).then(
            (failureOrUnit) => failureOrUnit.fold(
              (failure) => emit(FriendRequestActorState.actionFailed(failure)),
              (success) =>
                  emit(const FriendRequestActorState.requestConfirmSuccess()),
            ),
          );
    }
  }

  Future<void> onRejectRequestClicked(String requestId) async {
    if (state is _Initial || state is _ActionFailed) {
      emit(FriendRequestActorState.isRejecting(requestId));

      await _repo.rejectFriendRequest(requestId).then(
            (failureOrUnit) => failureOrUnit.fold(
              (failure) => emit(FriendRequestActorState.actionFailed(failure)),
              (success) =>
                  emit(const FriendRequestActorState.requestRejectedSuccess()),
            ),
          );
    }
  }

  Future<void> onWithdrawRequestClicked(String userId) async {
    if (state is _Initial || state is _ActionFailed) {
      emit(const FriendRequestActorState.isLoading());

      await _repo.withdrawFriendRequest(userId).then(
            (failureOrUnit) => failureOrUnit.fold(
              (failure) => emit(FriendRequestActorState.actionFailed(failure)),
              (success) =>
                  emit(const FriendRequestActorState.requestWithdrawSuccess()),
            ),
          );
    }
  }
}
