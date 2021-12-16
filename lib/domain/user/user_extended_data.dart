// ignore_for_file: invalid_annotation_target, constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dish/domain/friend_request/friend_request.dart';

part 'user_extended_data.freezed.dart';

@freezed
class UserExtendedData with _$UserExtendedData {
  const UserExtendedData._();

  const factory UserExtendedData({
    required bool isFriend,
    required bool hasSentFriendRequest,
    required bool hasReceivedFriendRequest,
    required bool isSignedInUser,
    FriendRequest? friendRequest,
  }) = _UserExtendedData;
}
