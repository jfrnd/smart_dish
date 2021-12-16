import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_dish/application/watcher/friend_request_watcher_cubit.dart';
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
  final FriendRequestWatcherCubit _friendRequestWatcherCubit;
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
}

class Pair<T1, T2> {
  Pair(
    this.first,
    this.second,
  );

  final T1 first;
  final T2 second;

  @override
  String toString() => 'Pair[$first, $second]';
}

extension UsersX on List<User> {
  List<User> extended(
    List<FriendRequest> friendRequests,
    List<User> friends,
    String userId,
  ) {
    return map((user) {
      final isFriend = friends.any((friend) => friend.id == user.id);
      final isSignedInUser = userId == user.id;

      final hasReceievedFriendRequest =
          friendRequests.any((request) => request.receiverId == user.id);

      final hasSentFriendRequest =
          friendRequests.any((request) => request.senderId == user.id);

      final friendRequest = friendRequests.firstWhereOrNull((request) =>
          request.senderId == user.id || request.receiverId == user.id);

      final extendedData = UserExtendedData(
        isFriend: isFriend,
        hasSentFriendRequest: hasSentFriendRequest && !isSignedInUser,
        hasReceivedFriendRequest: hasReceievedFriendRequest && !isSignedInUser,
        friendRequest: friendRequest,
        isSignedInUser: isSignedInUser,
      );
      return user.copyWith(extendedData: extendedData);
    }).toList();
  }
}
