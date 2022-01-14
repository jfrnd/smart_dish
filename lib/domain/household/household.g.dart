// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'household.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Household _$$_HouseholdFromJson(Map<String, dynamic> json) => _$_Household(
      createdAt: DateTimeConverter.dateTimeFromTimestamp(
          json['createdAt'] as Timestamp),
      updatedAt: DateTimeConverter.dateTimeFromTimestamp(
          json['updatedAt'] as Timestamp),
      imageUrl: json['imageUrl'] as String,
      name: json['name'] as String,
      createdBy: json['createdBy'] as String,
      members:
          (json['members'] as List<dynamic>).map((e) => e as String).toList(),
      admins:
          (json['admins'] as List<dynamic>).map((e) => e as String).toList(),
      updatedBy: json['updatedBy'] as String,
      membersUserData: (json['membersUserData'] as List<dynamic>?)
              ?.map((e) => User.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      adminsUserData: (json['adminsUserData'] as List<dynamic>?)
              ?.map((e) => User.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_HouseholdToJson(_$_Household instance) =>
    <String, dynamic>{
      'createdAt': DateTimeConverter.dateTimeToTimestamp(instance.createdAt),
      'updatedAt': DateTimeConverter.dateTimeToTimestamp(instance.updatedAt),
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'createdBy': instance.createdBy,
      'members': instance.members,
      'admins': instance.admins,
      'updatedBy': instance.updatedBy,
      'membersUserData': instance.membersUserData,
      'adminsUserData': instance.adminsUserData,
    };
