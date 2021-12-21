import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_dish/application/search_user/search_user_cubit.dart';
import 'package:smart_dish/domain/core/crud_failure.dart';
import 'package:smart_dish/domain/friend_request/i_friend_request_repo.dart';
import 'package:smart_dish/domain/user/user.dart';

part 'friend_actor_state.dart';
part 'friend_actor_cubit.freezed.dart';

@injectable
class FriendActorCubit extends Cubit<FriendActorState> {
  FriendActorCubit(this._repo) : super(const FriendActorState.initial());

  final IFriendRequestRepo _repo;

  Future<void> onDeleteFriendClicked(User user) async {
    if (state is! IsLoading) {
      emit(const FriendActorState.isLoading());

      await _repo.deleteFriend(user.id!).then(
            (failureOrSuccess) => failureOrSuccess.fold(
              (failure) => emit(FriendActorState.actionFailure(failure)),
              (success) => emit(const FriendActorState.actionSuccess()),
            ),
          );
    }
  }
}
