// ignore_for_file: invalid_annotation_target, constant_identifier_names

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_dish/domain/core/crud_failure.dart';

part 'friend_request.g.dart';
part 'friend_request.freezed.dart';

const CREATED_AT = 'createdAt';
const UPDATED_AT = 'updatedAt';

@freezed
class FriendRequest with _$FriendRequest {
  FriendRequest._();

  factory FriendRequest({
    @JsonKey(ignore: true) String? id,
    @JsonKey(ignore: true) DateTime? createdAt,
    required bool? accepted,
    required String senderId,
    required String senderName,
    required String senderImageUrl,
    required String receiverId,
    required String receiverName,
    required String receiverImageUrl,
    @JsonKey(defaultValue: false) required bool isReceivedBySignedInUser,
    @JsonKey(defaultValue: false) required bool isBeingConfirmed,
    @JsonKey(defaultValue: false) required bool isBeingRejected,
    @JsonKey(ignore: true) CrudFailure? actionFailure,
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

  factory FriendRequest.empty() => FriendRequest(
        accepted: null,
        senderId: "",
        senderName: "",
        senderImageUrl: "",
        receiverId: "",
        receiverName: "",
        receiverImageUrl: "",
        isReceivedBySignedInUser: false,
        isBeingConfirmed: false,
        isBeingRejected: false,
      );
}
