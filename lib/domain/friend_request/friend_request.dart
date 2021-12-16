// ignore_for_file: invalid_annotation_target, constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'friend_request.g.dart';
part 'friend_request.freezed.dart';

const CREATED_AT = 'createdAt';
const UPDATED_AT = 'updatedAt';

@freezed
class FriendRequest with _$FriendRequest {
  const FriendRequest._();

  const factory FriendRequest({
    @JsonKey(ignore: true) String? id,
    @JsonKey(ignore: true) DateTime? createdAt,
    required bool? accepted,
    required String senderId,
    required String senderName,
    required String senderImageUrl,
    required String receiverId,
    required String receiverName,
    required String receiverImageUrl,
    @JsonKey(ignore: true) bool? isReceivedBySignedInUser,
  }) = _FriendRequest;

  factory FriendRequest.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    return FriendRequest.fromJson(snapshot.data()!).copyWith(
      id: snapshot.id,
      createdAt: (snapshot.get(CREATED_AT) as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore(SetOptions? setOptions) {
    final asJson = toJson();
    asJson.addAll(
      {
        CREATED_AT: Timestamp.fromDate(createdAt!),
      },
    );
    return asJson;
  }

  factory FriendRequest.fromJson(Map<String, dynamic> json) =>
      _$FriendRequestFromJson(json);
}
