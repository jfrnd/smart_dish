// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_extended_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserExtendedDataTearOff {
  const _$UserExtendedDataTearOff();

  _UserExtendedData call(
      {required bool isSendingFriendRequest,
      Either<CrudFailure, Unit>? sendingRequestFailureOrSuccess,
      required bool isFriend,
      required bool isSignedInUser,
      FriendRequest? friendRequest}) {
    return _UserExtendedData(
      isSendingFriendRequest: isSendingFriendRequest,
      sendingRequestFailureOrSuccess: sendingRequestFailureOrSuccess,
      isFriend: isFriend,
      isSignedInUser: isSignedInUser,
      friendRequest: friendRequest,
    );
  }
}

/// @nodoc
const $UserExtendedData = _$UserExtendedDataTearOff();

/// @nodoc
mixin _$UserExtendedData {
  bool get isSendingFriendRequest => throw _privateConstructorUsedError;
  Either<CrudFailure, Unit>? get sendingRequestFailureOrSuccess =>
      throw _privateConstructorUsedError;
  bool get isFriend => throw _privateConstructorUsedError;
  bool get isSignedInUser => throw _privateConstructorUsedError;
  FriendRequest? get friendRequest => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserExtendedDataCopyWith<UserExtendedData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserExtendedDataCopyWith<$Res> {
  factory $UserExtendedDataCopyWith(
          UserExtendedData value, $Res Function(UserExtendedData) then) =
      _$UserExtendedDataCopyWithImpl<$Res>;
  $Res call(
      {bool isSendingFriendRequest,
      Either<CrudFailure, Unit>? sendingRequestFailureOrSuccess,
      bool isFriend,
      bool isSignedInUser,
      FriendRequest? friendRequest});

  $FriendRequestCopyWith<$Res>? get friendRequest;
}

/// @nodoc
class _$UserExtendedDataCopyWithImpl<$Res>
    implements $UserExtendedDataCopyWith<$Res> {
  _$UserExtendedDataCopyWithImpl(this._value, this._then);

  final UserExtendedData _value;
  // ignore: unused_field
  final $Res Function(UserExtendedData) _then;

  @override
  $Res call({
    Object? isSendingFriendRequest = freezed,
    Object? sendingRequestFailureOrSuccess = freezed,
    Object? isFriend = freezed,
    Object? isSignedInUser = freezed,
    Object? friendRequest = freezed,
  }) {
    return _then(_value.copyWith(
      isSendingFriendRequest: isSendingFriendRequest == freezed
          ? _value.isSendingFriendRequest
          : isSendingFriendRequest // ignore: cast_nullable_to_non_nullable
              as bool,
      sendingRequestFailureOrSuccess: sendingRequestFailureOrSuccess == freezed
          ? _value.sendingRequestFailureOrSuccess
          : sendingRequestFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Either<CrudFailure, Unit>?,
      isFriend: isFriend == freezed
          ? _value.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool,
      isSignedInUser: isSignedInUser == freezed
          ? _value.isSignedInUser
          : isSignedInUser // ignore: cast_nullable_to_non_nullable
              as bool,
      friendRequest: friendRequest == freezed
          ? _value.friendRequest
          : friendRequest // ignore: cast_nullable_to_non_nullable
              as FriendRequest?,
    ));
  }

  @override
  $FriendRequestCopyWith<$Res>? get friendRequest {
    if (_value.friendRequest == null) {
      return null;
    }

    return $FriendRequestCopyWith<$Res>(_value.friendRequest!, (value) {
      return _then(_value.copyWith(friendRequest: value));
    });
  }
}

/// @nodoc
abstract class _$UserExtendedDataCopyWith<$Res>
    implements $UserExtendedDataCopyWith<$Res> {
  factory _$UserExtendedDataCopyWith(
          _UserExtendedData value, $Res Function(_UserExtendedData) then) =
      __$UserExtendedDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isSendingFriendRequest,
      Either<CrudFailure, Unit>? sendingRequestFailureOrSuccess,
      bool isFriend,
      bool isSignedInUser,
      FriendRequest? friendRequest});

  @override
  $FriendRequestCopyWith<$Res>? get friendRequest;
}

/// @nodoc
class __$UserExtendedDataCopyWithImpl<$Res>
    extends _$UserExtendedDataCopyWithImpl<$Res>
    implements _$UserExtendedDataCopyWith<$Res> {
  __$UserExtendedDataCopyWithImpl(
      _UserExtendedData _value, $Res Function(_UserExtendedData) _then)
      : super(_value, (v) => _then(v as _UserExtendedData));

  @override
  _UserExtendedData get _value => super._value as _UserExtendedData;

  @override
  $Res call({
    Object? isSendingFriendRequest = freezed,
    Object? sendingRequestFailureOrSuccess = freezed,
    Object? isFriend = freezed,
    Object? isSignedInUser = freezed,
    Object? friendRequest = freezed,
  }) {
    return _then(_UserExtendedData(
      isSendingFriendRequest: isSendingFriendRequest == freezed
          ? _value.isSendingFriendRequest
          : isSendingFriendRequest // ignore: cast_nullable_to_non_nullable
              as bool,
      sendingRequestFailureOrSuccess: sendingRequestFailureOrSuccess == freezed
          ? _value.sendingRequestFailureOrSuccess
          : sendingRequestFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Either<CrudFailure, Unit>?,
      isFriend: isFriend == freezed
          ? _value.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool,
      isSignedInUser: isSignedInUser == freezed
          ? _value.isSignedInUser
          : isSignedInUser // ignore: cast_nullable_to_non_nullable
              as bool,
      friendRequest: friendRequest == freezed
          ? _value.friendRequest
          : friendRequest // ignore: cast_nullable_to_non_nullable
              as FriendRequest?,
    ));
  }
}

/// @nodoc

class _$_UserExtendedData extends _UserExtendedData {
  const _$_UserExtendedData(
      {required this.isSendingFriendRequest,
      this.sendingRequestFailureOrSuccess,
      required this.isFriend,
      required this.isSignedInUser,
      this.friendRequest})
      : super._();

  @override
  final bool isSendingFriendRequest;
  @override
  final Either<CrudFailure, Unit>? sendingRequestFailureOrSuccess;
  @override
  final bool isFriend;
  @override
  final bool isSignedInUser;
  @override
  final FriendRequest? friendRequest;

  @override
  String toString() {
    return 'UserExtendedData(isSendingFriendRequest: $isSendingFriendRequest, sendingRequestFailureOrSuccess: $sendingRequestFailureOrSuccess, isFriend: $isFriend, isSignedInUser: $isSignedInUser, friendRequest: $friendRequest)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserExtendedData &&
            const DeepCollectionEquality()
                .equals(other.isSendingFriendRequest, isSendingFriendRequest) &&
            const DeepCollectionEquality().equals(
                other.sendingRequestFailureOrSuccess,
                sendingRequestFailureOrSuccess) &&
            const DeepCollectionEquality().equals(other.isFriend, isFriend) &&
            const DeepCollectionEquality()
                .equals(other.isSignedInUser, isSignedInUser) &&
            const DeepCollectionEquality()
                .equals(other.friendRequest, friendRequest));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isSendingFriendRequest),
      const DeepCollectionEquality().hash(sendingRequestFailureOrSuccess),
      const DeepCollectionEquality().hash(isFriend),
      const DeepCollectionEquality().hash(isSignedInUser),
      const DeepCollectionEquality().hash(friendRequest));

  @JsonKey(ignore: true)
  @override
  _$UserExtendedDataCopyWith<_UserExtendedData> get copyWith =>
      __$UserExtendedDataCopyWithImpl<_UserExtendedData>(this, _$identity);
}

abstract class _UserExtendedData extends UserExtendedData {
  const factory _UserExtendedData(
      {required bool isSendingFriendRequest,
      Either<CrudFailure, Unit>? sendingRequestFailureOrSuccess,
      required bool isFriend,
      required bool isSignedInUser,
      FriendRequest? friendRequest}) = _$_UserExtendedData;
  const _UserExtendedData._() : super._();

  @override
  bool get isSendingFriendRequest;
  @override
  Either<CrudFailure, Unit>? get sendingRequestFailureOrSuccess;
  @override
  bool get isFriend;
  @override
  bool get isSignedInUser;
  @override
  FriendRequest? get friendRequest;
  @override
  @JsonKey(ignore: true)
  _$UserExtendedDataCopyWith<_UserExtendedData> get copyWith =>
      throw _privateConstructorUsedError;
}
