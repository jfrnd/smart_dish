// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FriendRequest _$$_FriendRequestFromJson(Map<String, dynamic> json) =>
    _$_FriendRequest(
      accepted: json['accepted'] as bool?,
      senderId: json['senderId'] as String,
      senderName: json['senderName'] as String,
      senderImageUrl: json['senderImageUrl'] as String,
      receiverId: json['receiverId'] as String,
      receiverName: json['receiverName'] as String,
      receiverImageUrl: json['receiverImageUrl'] as String,
    );

Map<String, dynamic> _$$_FriendRequestToJson(_$_FriendRequest instance) =>
    <String, dynamic>{
      'accepted': instance.accepted,
      'senderId': instance.senderId,
      'senderName': instance.senderName,
      'senderImageUrl': instance.senderImageUrl,
      'receiverId': instance.receiverId,
      'receiverName': instance.receiverName,
      'receiverImageUrl': instance.receiverImageUrl,
    };
