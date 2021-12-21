import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_dish/application/watcher/friend_request_cubit.dart';
import 'package:smart_dish/application/watcher/friend_watcher_cubit.dart';
import 'package:smart_dish/auth/i_auth_repo.dart';

import 'package:smart_dish/domain/core/crud_failure.dart';
import 'package:smart_dish/domain/friend_request/friend_request.dart';
import 'package:smart_dish/domain/friend_request/i_friend_request_repo.dart';
import 'package:smart_dish/domain/user/user.dart';
import 'package:smart_dish/domain/user/user_extended_data.dart';

part 'search_user_cubit.freezed.dart';
part 'search_user_state.dart';

@injectable
class SearchUserCubit extends Cubit<SearchUserState> {
  final IFriendRequestRepo _repo;
  final FriendRequestCubit _friendRequestWatcherCubit;
  final FriendWatcherCubit _friendWatcherCubit;
  final IAuthRepo _authRepo;

  SearchUserCubit(
    this._repo,
    this._friendRequestWatcherCubit,
    this._friendWatcherCubit,
    this._authRepo,
  ) : super(const SearchUserState.initial());

  Future<void> onSearchClicked(String query) async {
    emit(const SearchUserState.isLoading());

    final List<FriendRequest> friendRequests =
        _friendRequestWatcherCubit.state.maybeMap(
      orElse: () => [],
      loadingSuccessful: (state) => state.data,
    );

    final List<User> friends = _friendWatcherCubit.state.maybeMap(
      orElse: () => [],
      loadingSuccessful: (state) => state.data,
    );

    final signedInUserId = await _authRepo.getUserId();

    _repo.searchUser(query).then(
          (failureOrFriend) => failureOrFriend.fold(
            (failure) => emit(SearchUserState.loadingFailed(failure)),
            (users) {
              final extendedUsers =
                  users.extended(friendRequests, friends, signedInUserId);

              emit(SearchUserState.loadingSuccessful(extendedUsers));
            },
          ),
        );
  }

  Future<void> onSendFriendRequestClicked(User user) async {
    state.maybeMap(
        orElse: () {},
        loadingSuccessful: (state) async {
          if (setUserToLoadingState(state, user.id!)) {
            await _repo.sendFriendRequest(user).then(
                  (failureOrSuccess) => failureOrSuccess.fold(
                    (failure) => setUserSendRequestResult(
                      state,
                      user.id!,
                      left(failure),
                    ),
                    (success) => setUserSendRequestResult(
                      state,
                      user.id!,
                      right(unit),
                    ),
                  ),
                );
          }
        });
  }

  void setUserSendRequestResult(LoadingSuccessful state, String userId,
      Either<CrudFailure, Unit> result) {
    final userRequestResult = state.users.map(
      (u) {
        if (userId == u.id) {
          return u.copyWith(
            extendedData: u.extendedData?.copyWith(
              sendingRequestFailureOrSuccess: result,
              isSendingFriendRequest: false,
            ),
          );
        } else {
          return u;
        }
      },
    ).toList();

    emit(SearchUserState.loadingSuccessful(userRequestResult));
  }

  bool setUserToLoadingState(LoadingSuccessful state, String userId) {
    bool haveSetToLoadingState = false;
    final loadingInProgress = state.users.map(
      (user) {
        if (userId == user.id && !user.isSendingFriendRequest) {
          haveSetToLoadingState = true;
          return user.withSendingFriendRequest();
        } else {
          return user;
        }
      },
    ).toList();

    emit(SearchUserState.loadingSuccessful(loadingInProgress));
    return haveSetToLoadingState;
  }
}




