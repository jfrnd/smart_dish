// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      userName: json['userName'] as String,
      imageUrl: json['imageUrl'] as String,
      createdAt: DateTimeConverter.dateTimeFromTimestamp(
          json['createdAt'] as Timestamp),
      updatedAt: DateTimeConverter.dateTimeFromTimestamp(
          json['updatedAt'] as Timestamp),
      email: json['email'] as String? ?? '',
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'userName': instance.userName,
      'imageUrl': instance.imageUrl,
      'createdAt': DateTimeConverter.dateTimeToTimestamp(instance.createdAt),
      'updatedAt': DateTimeConverter.dateTimeToTimestamp(instance.updatedAt),
      'email': instance.email,
    };
