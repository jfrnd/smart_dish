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
      memberIds:
          (json['members'] as List<dynamic>).map((e) => e as String).toList(),
      adminIds:
          (json['admins'] as List<dynamic>).map((e) => e as String).toList(),
      updatedBy: json['updatedBy'] as String,
      members: (json['memberUserData'] as List<dynamic>?)
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
      'members': instance.memberIds,
      'admins': instance.adminIds,
      'updatedBy': instance.updatedBy,
      'memberUserData': instance.members,
    };
