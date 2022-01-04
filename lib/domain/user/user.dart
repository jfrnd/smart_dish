// ignore_for_file: invalid_annotation_target, constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dish/domain/user/user_extended_data.dart';
import 'package:smart_dish/utils/date_time_extensions.dart';

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
    @JsonKey(ignore: true)
        String? id,
    required String userName,
    required String imageUrl,
    @JsonKey(
      name: CREATED_AT,
      fromJson: DateTimeConverter.dateTimeFromTimestamp,
      toJson: DateTimeConverter.dateTimeToTimestamp,
    )
        required DateTime createdAt,
    @JsonKey(
      name: UPDATED_AT,
      fromJson: DateTimeConverter.dateTimeFromTimestamp,
      toJson: DateTimeConverter.dateTimeToTimestamp,
    )
        required DateTime updatedAt,
    @JsonKey(defaultValue: "")
        required String email,
    @JsonKey(ignore: true)
        UserExtendedData? extendedData,
  }) = _User;

  factory User.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    return User.fromJson(snapshot.data()!).copyWith(
      id: snapshot.id,
      email: "",
    );
  }

  Map<String, dynamic> toFirestore(SetOptions? setOptions) => toJson();

  factory User.empty() => User(
        createdAt: DateTime(2000),
        updatedAt: DateTime(2000),
        imageUrl: "",
        userName: "",
        email: "",
      );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
