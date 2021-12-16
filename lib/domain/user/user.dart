// ignore_for_file: invalid_annotation_target, constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dish/domain/user/user_extended_data.dart';

part 'user.g.dart';
part 'user.freezed.dart';

const USERS = "users";
const USER_NAME = "userName";
const CREATED_AT = "createdAt";
const UPDATED_AT = "updatedAt";
const IMAGE_URL = "imageUrl";
const EMAIL = "email";

@freezed
class User with _$User {
  const User._();

  const factory User({
    @JsonKey(ignore: true) String? id,
    required String userName,
    required String imageUrl,
    @JsonKey(ignore: true) DateTime? createdAt,
    @JsonKey(ignore: true) DateTime? updatedAt,
    @JsonKey(ignore: true) String? email,
    @JsonKey(ignore: true) UserExtendedData? extendedData,
  }) = _User;

  factory User.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    return User.fromJson(snapshot.data()!).copyWith(
      id: snapshot.id,
      createdAt: (snapshot.get(CREATED_AT) as Timestamp).toDate(),
      updatedAt: (snapshot.get(UPDATED_AT) as Timestamp).toDate(),
      email: "",
    );
  }

  Map<String, dynamic> toFirestore(SetOptions? setOptions) {
    final asJson = toJson();
    asJson.addAll(
      {
        CREATED_AT: Timestamp.fromDate(createdAt!),
        UPDATED_AT: Timestamp.fromDate(updatedAt!)
      },
    );
    return asJson;
  }

  factory User.empty() => const User(
        imageUrl: "",
        userName: "",
        email: "",
      );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
