// ignore_for_file: invalid_annotation_target, constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dish/domain/core/crud_failure.dart';
import 'package:smart_dish/domain/friend_request/friend_request.dart';
import 'package:smart_dish/domain/user/user.dart';

part 'user_extended_data.freezed.dart';

@freezed
class UserExtendedData with _$UserExtendedData {
  const UserExtendedData._();

  const factory UserExtendedData({
    required bool isSendingFriendRequest,
    Either<CrudFailure, Unit>? sendingRequestFailureOrSuccess,
    required bool isFriend,
    required bool isSignedInUser,
    FriendRequest? friendRequest,
  }) = _UserExtendedData;
}

extension UserX on User {
  bool get isSendingFriendRequest => extendedData!.isSendingFriendRequest;
  Either<CrudFailure, Unit>? get sendingRequestFailureOrSuccess =>
      extendedData!.sendingRequestFailureOrSuccess;
  bool get isFriend => extendedData!.isFriend;
  bool get isSignedInUser => extendedData!.isSignedInUser;
  bool get hasOpenFriendRequest => extendedData!.friendRequest != null;
  FriendRequest? get friendRequest => extendedData!.friendRequest;

  User withSendingFriendRequest() => copyWith(
        extendedData: extendedData?.copyWith(
          isSendingFriendRequest: true,
        ),
      );
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

      final friendRequest = friendRequests.firstWhereOrNull((request) =>
          request.senderId == user.id || request.receiverId == user.id);

      final extendedData = UserExtendedData(
        isSendingFriendRequest: false,
        isFriend: isFriend,
        friendRequest: friendRequest,
        isSignedInUser: isSignedInUser,
      );
      return user.copyWith(extendedData: extendedData);
    }).toList();
  }
}
