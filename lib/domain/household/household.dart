// ignore_for_file: invalid_annotation_target, constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_dish/domain/user/user.dart';
import 'package:smart_dish/utils/collection_extension.dart';
import 'package:smart_dish/utils/date_time_extensions.dart';

part 'household.g.dart';
part 'household.freezed.dart';

const CREATED_AT = 'createdAt';
const UPDATED_AT = 'updatedAt';
const CREATED_BY = 'createdBy';

@freezed
class Household with _$Household {
  const Household._();

  const factory Household({
    @JsonKey(ignore: true)
        String? id,
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
    required String imageUrl,
    required String name,
    required String createdBy,
    required List<String> members,
    required List<String> admins,
    required String updatedBy,
    @JsonKey(defaultValue: <User>[])
        required List<User> membersUserData,
    @JsonKey(defaultValue: <User>[])
        required List<User>? adminsUserData,
    @JsonKey(ignore: true)
        User? creator,
  }) = _Household;

  factory Household.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    return Household.fromJson(snapshot.data()!).copyWith(id: snapshot.id);
  }

  Map<String, dynamic> toFirestore({SetOptions? setOptions}) =>
      toJson().withoutKeys(["membersUserData", "adminsUserData"]);

  factory Household.empty() => Household(
        adminsUserData: [],
        membersUserData: [],
        createdBy: "",
        updatedBy: "",
        imageUrl: "",
        admins: [],
        members: [],
        name: "",
        createdAt: DateTime(2000),
        id: "",
        updatedAt: DateTime(2000),
      );

  factory Household.fromJson(Map<String, dynamic> json) =>
      _$HouseholdFromJson(json);
}
