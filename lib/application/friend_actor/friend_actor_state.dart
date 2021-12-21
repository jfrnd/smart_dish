part of 'friend_actor_cubit.dart';

@freezed
class FriendActorState with _$FriendActorState {
  const factory FriendActorState.initial() = _Initial;
  const factory FriendActorState.isLoading() = _IsLoading;
  const factory FriendActorState.actionFailure(CrudFailure failure) =
      _ActionFailure;
  const factory FriendActorState.actionSuccess() = _ActionSuccess;
}
