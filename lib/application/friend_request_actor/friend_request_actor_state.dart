part of 'friend_request_actor_cubit.dart';

@freezed
class FriendRequestActorState with _$FriendRequestActorState {
  const factory FriendRequestActorState.initial() = _Initial;
  const factory FriendRequestActorState.isLoading() = _IsLoading;
  const factory FriendRequestActorState.isRejecting(String requestId) =
      _IsReejecting;
  const factory FriendRequestActorState.isConfirming(String requestId) =
      _IsAccepting;
  const factory FriendRequestActorState.actionFailed(CrudFailure failure) =
      _ActionFailed;
  const factory FriendRequestActorState.requestRejectedSuccess() =
      _RequestRejectedSuccess;
  const factory FriendRequestActorState.requestSentSuccess() =
      _RequestSentSuccess;
  const factory FriendRequestActorState.requestWithdrawSuccess() =
      _RequestWithdrawSuccess;
  const factory FriendRequestActorState.requestConfirmSuccess() =
      _RequestConfirmSuccess;
  const factory FriendRequestActorState.friendDeleteSuccess() =
      _FriendDeleteSuccess;
}
