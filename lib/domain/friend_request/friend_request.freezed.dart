// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'friend_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FriendRequest _$FriendRequestFromJson(Map<String, dynamic> json) {
  return _FriendRequest.fromJson(json);
}

/// @nodoc
class _$FriendRequestTearOff {
  const _$FriendRequestTearOff();

  _FriendRequest call(
      {@JsonKey(ignore: true) String? id,
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
      @JsonKey(ignore: true) CrudFailure? actionFailure}) {
    return _FriendRequest(
      id: id,
      createdAt: createdAt,
      accepted: accepted,
      senderId: senderId,
      senderName: senderName,
      senderImageUrl: senderImageUrl,
      receiverId: receiverId,
      receiverName: receiverName,
      receiverImageUrl: receiverImageUrl,
      isReceivedBySignedInUser: isReceivedBySignedInUser,
      isBeingConfirmed: isBeingConfirmed,
      isBeingRejected: isBeingRejected,
      actionFailure: actionFailure,
    );
  }

  FriendRequest fromJson(Map<String, Object?> json) {
    return FriendRequest.fromJson(json);
  }
}

/// @nodoc
const $FriendRequest = _$FriendRequestTearOff();

/// @nodoc
mixin _$FriendRequest {
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  bool? get accepted => throw _privateConstructorUsedError;
  String get senderId => throw _privateConstructorUsedError;
  String get senderName => throw _privateConstructorUsedError;
  String get senderImageUrl => throw _privateConstructorUsedError;
  String get receiverId => throw _privateConstructorUsedError;
  String get receiverName => throw _privateConstructorUsedError;
  String get receiverImageUrl => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool get isReceivedBySignedInUser => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool get isBeingConfirmed => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool get isBeingRejected => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  CrudFailure? get actionFailure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FriendRequestCopyWith<FriendRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendRequestCopyWith<$Res> {
  factory $FriendRequestCopyWith(
          FriendRequest value, $Res Function(FriendRequest) then) =
      _$FriendRequestCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) String? id,
      @JsonKey(ignore: true) DateTime? createdAt,
      bool? accepted,
      String senderId,
      String senderName,
      String senderImageUrl,
      String receiverId,
      String receiverName,
      String receiverImageUrl,
      @JsonKey(defaultValue: false) bool isReceivedBySignedInUser,
      @JsonKey(defaultValue: false) bool isBeingConfirmed,
      @JsonKey(defaultValue: false) bool isBeingRejected,
      @JsonKey(ignore: true) CrudFailure? actionFailure});

  $CrudFailureCopyWith<$Res>? get actionFailure;
}

/// @nodoc
class _$FriendRequestCopyWithImpl<$Res>
    implements $FriendRequestCopyWith<$Res> {
  _$FriendRequestCopyWithImpl(this._value, this._then);

  final FriendRequest _value;
  // ignore: unused_field
  final $Res Function(FriendRequest) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? accepted = freezed,
    Object? senderId = freezed,
    Object? senderName = freezed,
    Object? senderImageUrl = freezed,
    Object? receiverId = freezed,
    Object? receiverName = freezed,
    Object? receiverImageUrl = freezed,
    Object? isReceivedBySignedInUser = freezed,
    Object? isBeingConfirmed = freezed,
    Object? isBeingRejected = freezed,
    Object? actionFailure = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      accepted: accepted == freezed
          ? _value.accepted
          : accepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      senderId: senderId == freezed
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      senderName: senderName == freezed
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String,
      senderImageUrl: senderImageUrl == freezed
          ? _value.senderImageUrl
          : senderImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: receiverId == freezed
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverName: receiverName == freezed
          ? _value.receiverName
          : receiverName // ignore: cast_nullable_to_non_nullable
              as String,
      receiverImageUrl: receiverImageUrl == freezed
          ? _value.receiverImageUrl
          : receiverImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isReceivedBySignedInUser: isReceivedBySignedInUser == freezed
          ? _value.isReceivedBySignedInUser
          : isReceivedBySignedInUser // ignore: cast_nullable_to_non_nullable
              as bool,
      isBeingConfirmed: isBeingConfirmed == freezed
          ? _value.isBeingConfirmed
          : isBeingConfirmed // ignore: cast_nullable_to_non_nullable
              as bool,
      isBeingRejected: isBeingRejected == freezed
          ? _value.isBeingRejected
          : isBeingRejected // ignore: cast_nullable_to_non_nullable
              as bool,
      actionFailure: actionFailure == freezed
          ? _value.actionFailure
          : actionFailure // ignore: cast_nullable_to_non_nullable
              as CrudFailure?,
    ));
  }

  @override
  $CrudFailureCopyWith<$Res>? get actionFailure {
    if (_value.actionFailure == null) {
      return null;
    }

    return $CrudFailureCopyWith<$Res>(_value.actionFailure!, (value) {
      return _then(_value.copyWith(actionFailure: value));
    });
  }
}

/// @nodoc
abstract class _$FriendRequestCopyWith<$Res>
    implements $FriendRequestCopyWith<$Res> {
  factory _$FriendRequestCopyWith(
          _FriendRequest value, $Res Function(_FriendRequest) then) =
      __$FriendRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) String? id,
      @JsonKey(ignore: true) DateTime? createdAt,
      bool? accepted,
      String senderId,
      String senderName,
      String senderImageUrl,
      String receiverId,
      String receiverName,
      String receiverImageUrl,
      @JsonKey(defaultValue: false) bool isReceivedBySignedInUser,
      @JsonKey(defaultValue: false) bool isBeingConfirmed,
      @JsonKey(defaultValue: false) bool isBeingRejected,
      @JsonKey(ignore: true) CrudFailure? actionFailure});

  @override
  $CrudFailureCopyWith<$Res>? get actionFailure;
}

/// @nodoc
class __$FriendRequestCopyWithImpl<$Res>
    extends _$FriendRequestCopyWithImpl<$Res>
    implements _$FriendRequestCopyWith<$Res> {
  __$FriendRequestCopyWithImpl(
      _FriendRequest _value, $Res Function(_FriendRequest) _then)
      : super(_value, (v) => _then(v as _FriendRequest));

  @override
  _FriendRequest get _value => super._value as _FriendRequest;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? accepted = freezed,
    Object? senderId = freezed,
    Object? senderName = freezed,
    Object? senderImageUrl = freezed,
    Object? receiverId = freezed,
    Object? receiverName = freezed,
    Object? receiverImageUrl = freezed,
    Object? isReceivedBySignedInUser = freezed,
    Object? isBeingConfirmed = freezed,
    Object? isBeingRejected = freezed,
    Object? actionFailure = freezed,
  }) {
    return _then(_FriendRequest(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      accepted: accepted == freezed
          ? _value.accepted
          : accepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      senderId: senderId == freezed
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      senderName: senderName == freezed
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String,
      senderImageUrl: senderImageUrl == freezed
          ? _value.senderImageUrl
          : senderImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: receiverId == freezed
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverName: receiverName == freezed
          ? _value.receiverName
          : receiverName // ignore: cast_nullable_to_non_nullable
              as String,
      receiverImageUrl: receiverImageUrl == freezed
          ? _value.receiverImageUrl
          : receiverImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isReceivedBySignedInUser: isReceivedBySignedInUser == freezed
          ? _value.isReceivedBySignedInUser
          : isReceivedBySignedInUser // ignore: cast_nullable_to_non_nullable
              as bool,
      isBeingConfirmed: isBeingConfirmed == freezed
          ? _value.isBeingConfirmed
          : isBeingConfirmed // ignore: cast_nullable_to_non_nullable
              as bool,
      isBeingRejected: isBeingRejected == freezed
          ? _value.isBeingRejected
          : isBeingRejected // ignore: cast_nullable_to_non_nullable
              as bool,
      actionFailure: actionFailure == freezed
          ? _value.actionFailure
          : actionFailure // ignore: cast_nullable_to_non_nullable
              as CrudFailure?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FriendRequest extends _FriendRequest {
  _$_FriendRequest(
      {@JsonKey(ignore: true) this.id,
      @JsonKey(ignore: true) this.createdAt,
      required this.accepted,
      required this.senderId,
      required this.senderName,
      required this.senderImageUrl,
      required this.receiverId,
      required this.receiverName,
      required this.receiverImageUrl,
      @JsonKey(defaultValue: false) required this.isReceivedBySignedInUser,
      @JsonKey(defaultValue: false) required this.isBeingConfirmed,
      @JsonKey(defaultValue: false) required this.isBeingRejected,
      @JsonKey(ignore: true) this.actionFailure})
      : super._();

  factory _$_FriendRequest.fromJson(Map<String, dynamic> json) =>
      _$$_FriendRequestFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? id;
  @override
  @JsonKey(ignore: true)
  final DateTime? createdAt;
  @override
  final bool? accepted;
  @override
  final String senderId;
  @override
  final String senderName;
  @override
  final String senderImageUrl;
  @override
  final String receiverId;
  @override
  final String receiverName;
  @override
  final String receiverImageUrl;
  @override
  @JsonKey(defaultValue: false)
  final bool isReceivedBySignedInUser;
  @override
  @JsonKey(defaultValue: false)
  final bool isBeingConfirmed;
  @override
  @JsonKey(defaultValue: false)
  final bool isBeingRejected;
  @override
  @JsonKey(ignore: true)
  final CrudFailure? actionFailure;

  @override
  String toString() {
    return 'FriendRequest(id: $id, createdAt: $createdAt, accepted: $accepted, senderId: $senderId, senderName: $senderName, senderImageUrl: $senderImageUrl, receiverId: $receiverId, receiverName: $receiverName, receiverImageUrl: $receiverImageUrl, isReceivedBySignedInUser: $isReceivedBySignedInUser, isBeingConfirmed: $isBeingConfirmed, isBeingRejected: $isBeingRejected, actionFailure: $actionFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FriendRequest &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.accepted, accepted) &&
            const DeepCollectionEquality().equals(other.senderId, senderId) &&
            const DeepCollectionEquality()
                .equals(other.senderName, senderName) &&
            const DeepCollectionEquality()
                .equals(other.senderImageUrl, senderImageUrl) &&
            const DeepCollectionEquality()
                .equals(other.receiverId, receiverId) &&
            const DeepCollectionEquality()
                .equals(other.receiverName, receiverName) &&
            const DeepCollectionEquality()
                .equals(other.receiverImageUrl, receiverImageUrl) &&
            const DeepCollectionEquality().equals(
                other.isReceivedBySignedInUser, isReceivedBySignedInUser) &&
            const DeepCollectionEquality()
                .equals(other.isBeingConfirmed, isBeingConfirmed) &&
            const DeepCollectionEquality()
                .equals(other.isBeingRejected, isBeingRejected) &&
            const DeepCollectionEquality()
                .equals(other.actionFailure, actionFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(accepted),
      const DeepCollectionEquality().hash(senderId),
      const DeepCollectionEquality().hash(senderName),
      const DeepCollectionEquality().hash(senderImageUrl),
      const DeepCollectionEquality().hash(receiverId),
      const DeepCollectionEquality().hash(receiverName),
      const DeepCollectionEquality().hash(receiverImageUrl),
      const DeepCollectionEquality().hash(isReceivedBySignedInUser),
      const DeepCollectionEquality().hash(isBeingConfirmed),
      const DeepCollectionEquality().hash(isBeingRejected),
      const DeepCollectionEquality().hash(actionFailure));

  @JsonKey(ignore: true)
  @override
  _$FriendRequestCopyWith<_FriendRequest> get copyWith =>
      __$FriendRequestCopyWithImpl<_FriendRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FriendRequestToJson(this);
  }
}

abstract class _FriendRequest extends FriendRequest {
  factory _FriendRequest(
      {@JsonKey(ignore: true) String? id,
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
      @JsonKey(ignore: true) CrudFailure? actionFailure}) = _$_FriendRequest;
  _FriendRequest._() : super._();

  factory _FriendRequest.fromJson(Map<String, dynamic> json) =
      _$_FriendRequest.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get id;
  @override
  @JsonKey(ignore: true)
  DateTime? get createdAt;
  @override
  bool? get accepted;
  @override
  String get senderId;
  @override
  String get senderName;
  @override
  String get senderImageUrl;
  @override
  String get receiverId;
  @override
  String get receiverName;
  @override
  String get receiverImageUrl;
  @override
  @JsonKey(defaultValue: false)
  bool get isReceivedBySignedInUser;
  @override
  @JsonKey(defaultValue: false)
  bool get isBeingConfirmed;
  @override
  @JsonKey(defaultValue: false)
  bool get isBeingRejected;
  @override
  @JsonKey(ignore: true)
  CrudFailure? get actionFailure;
  @override
  @JsonKey(ignore: true)
  _$FriendRequestCopyWith<_FriendRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
