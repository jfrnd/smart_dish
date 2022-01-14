// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'household.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Household _$HouseholdFromJson(Map<String, dynamic> json) {
  return _Household.fromJson(json);
}

/// @nodoc
class _$HouseholdTearOff {
  const _$HouseholdTearOff();

  _Household call(
      {@JsonKey(ignore: true)
          String? id,
      @JsonKey(name: CREATED_AT, fromJson: DateTimeConverter.dateTimeFromTimestamp, toJson: DateTimeConverter.dateTimeToTimestamp)
          required DateTime createdAt,
      @JsonKey(name: UPDATED_AT, fromJson: DateTimeConverter.dateTimeFromTimestamp, toJson: DateTimeConverter.dateTimeToTimestamp)
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
          User? creator}) {
    return _Household(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      imageUrl: imageUrl,
      name: name,
      createdBy: createdBy,
      members: members,
      admins: admins,
      updatedBy: updatedBy,
      membersUserData: membersUserData,
      adminsUserData: adminsUserData,
      creator: creator,
    );
  }

  Household fromJson(Map<String, Object?> json) {
    return Household.fromJson(json);
  }
}

/// @nodoc
const $Household = _$HouseholdTearOff();

/// @nodoc
mixin _$Household {
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(
      name: CREATED_AT,
      fromJson: DateTimeConverter.dateTimeFromTimestamp,
      toJson: DateTimeConverter.dateTimeToTimestamp)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(
      name: UPDATED_AT,
      fromJson: DateTimeConverter.dateTimeFromTimestamp,
      toJson: DateTimeConverter.dateTimeToTimestamp)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  List<String> get members => throw _privateConstructorUsedError;
  List<String> get admins => throw _privateConstructorUsedError;
  String get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: <User>[])
  List<User> get membersUserData => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: <User>[])
  List<User>? get adminsUserData => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  User? get creator => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HouseholdCopyWith<Household> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HouseholdCopyWith<$Res> {
  factory $HouseholdCopyWith(Household value, $Res Function(Household) then) =
      _$HouseholdCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true)
          String? id,
      @JsonKey(name: CREATED_AT, fromJson: DateTimeConverter.dateTimeFromTimestamp, toJson: DateTimeConverter.dateTimeToTimestamp)
          DateTime createdAt,
      @JsonKey(name: UPDATED_AT, fromJson: DateTimeConverter.dateTimeFromTimestamp, toJson: DateTimeConverter.dateTimeToTimestamp)
          DateTime updatedAt,
      String imageUrl,
      String name,
      String createdBy,
      List<String> members,
      List<String> admins,
      String updatedBy,
      @JsonKey(defaultValue: <User>[])
          List<User> membersUserData,
      @JsonKey(defaultValue: <User>[])
          List<User>? adminsUserData,
      @JsonKey(ignore: true)
          User? creator});

  $UserCopyWith<$Res>? get creator;
}

/// @nodoc
class _$HouseholdCopyWithImpl<$Res> implements $HouseholdCopyWith<$Res> {
  _$HouseholdCopyWithImpl(this._value, this._then);

  final Household _value;
  // ignore: unused_field
  final $Res Function(Household) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? imageUrl = freezed,
    Object? name = freezed,
    Object? createdBy = freezed,
    Object? members = freezed,
    Object? admins = freezed,
    Object? updatedBy = freezed,
    Object? membersUserData = freezed,
    Object? adminsUserData = freezed,
    Object? creator = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: createdBy == freezed
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      members: members == freezed
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>,
      admins: admins == freezed
          ? _value.admins
          : admins // ignore: cast_nullable_to_non_nullable
              as List<String>,
      updatedBy: updatedBy == freezed
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String,
      membersUserData: membersUserData == freezed
          ? _value.membersUserData
          : membersUserData // ignore: cast_nullable_to_non_nullable
              as List<User>,
      adminsUserData: adminsUserData == freezed
          ? _value.adminsUserData
          : adminsUserData // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      creator: creator == freezed
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }

  @override
  $UserCopyWith<$Res>? get creator {
    if (_value.creator == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.creator!, (value) {
      return _then(_value.copyWith(creator: value));
    });
  }
}

/// @nodoc
abstract class _$HouseholdCopyWith<$Res> implements $HouseholdCopyWith<$Res> {
  factory _$HouseholdCopyWith(
          _Household value, $Res Function(_Household) then) =
      __$HouseholdCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true)
          String? id,
      @JsonKey(name: CREATED_AT, fromJson: DateTimeConverter.dateTimeFromTimestamp, toJson: DateTimeConverter.dateTimeToTimestamp)
          DateTime createdAt,
      @JsonKey(name: UPDATED_AT, fromJson: DateTimeConverter.dateTimeFromTimestamp, toJson: DateTimeConverter.dateTimeToTimestamp)
          DateTime updatedAt,
      String imageUrl,
      String name,
      String createdBy,
      List<String> members,
      List<String> admins,
      String updatedBy,
      @JsonKey(defaultValue: <User>[])
          List<User> membersUserData,
      @JsonKey(defaultValue: <User>[])
          List<User>? adminsUserData,
      @JsonKey(ignore: true)
          User? creator});

  @override
  $UserCopyWith<$Res>? get creator;
}

/// @nodoc
class __$HouseholdCopyWithImpl<$Res> extends _$HouseholdCopyWithImpl<$Res>
    implements _$HouseholdCopyWith<$Res> {
  __$HouseholdCopyWithImpl(_Household _value, $Res Function(_Household) _then)
      : super(_value, (v) => _then(v as _Household));

  @override
  _Household get _value => super._value as _Household;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? imageUrl = freezed,
    Object? name = freezed,
    Object? createdBy = freezed,
    Object? members = freezed,
    Object? admins = freezed,
    Object? updatedBy = freezed,
    Object? membersUserData = freezed,
    Object? adminsUserData = freezed,
    Object? creator = freezed,
  }) {
    return _then(_Household(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: createdBy == freezed
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      members: members == freezed
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>,
      admins: admins == freezed
          ? _value.admins
          : admins // ignore: cast_nullable_to_non_nullable
              as List<String>,
      updatedBy: updatedBy == freezed
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String,
      membersUserData: membersUserData == freezed
          ? _value.membersUserData
          : membersUserData // ignore: cast_nullable_to_non_nullable
              as List<User>,
      adminsUserData: adminsUserData == freezed
          ? _value.adminsUserData
          : adminsUserData // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      creator: creator == freezed
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Household extends _Household {
  const _$_Household(
      {@JsonKey(ignore: true)
          this.id,
      @JsonKey(name: CREATED_AT, fromJson: DateTimeConverter.dateTimeFromTimestamp, toJson: DateTimeConverter.dateTimeToTimestamp)
          required this.createdAt,
      @JsonKey(name: UPDATED_AT, fromJson: DateTimeConverter.dateTimeFromTimestamp, toJson: DateTimeConverter.dateTimeToTimestamp)
          required this.updatedAt,
      required this.imageUrl,
      required this.name,
      required this.createdBy,
      required this.members,
      required this.admins,
      required this.updatedBy,
      @JsonKey(defaultValue: <User>[])
          required this.membersUserData,
      @JsonKey(defaultValue: <User>[])
          required this.adminsUserData,
      @JsonKey(ignore: true)
          this.creator})
      : super._();

  factory _$_Household.fromJson(Map<String, dynamic> json) =>
      _$$_HouseholdFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? id;
  @override
  @JsonKey(
      name: CREATED_AT,
      fromJson: DateTimeConverter.dateTimeFromTimestamp,
      toJson: DateTimeConverter.dateTimeToTimestamp)
  final DateTime createdAt;
  @override
  @JsonKey(
      name: UPDATED_AT,
      fromJson: DateTimeConverter.dateTimeFromTimestamp,
      toJson: DateTimeConverter.dateTimeToTimestamp)
  final DateTime updatedAt;
  @override
  final String imageUrl;
  @override
  final String name;
  @override
  final String createdBy;
  @override
  final List<String> members;
  @override
  final List<String> admins;
  @override
  final String updatedBy;
  @override
  @JsonKey(defaultValue: <User>[])
  final List<User> membersUserData;
  @override
  @JsonKey(defaultValue: <User>[])
  final List<User>? adminsUserData;
  @override
  @JsonKey(ignore: true)
  final User? creator;

  @override
  String toString() {
    return 'Household(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, imageUrl: $imageUrl, name: $name, createdBy: $createdBy, members: $members, admins: $admins, updatedBy: $updatedBy, membersUserData: $membersUserData, adminsUserData: $adminsUserData, creator: $creator)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Household &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.createdBy, createdBy) &&
            const DeepCollectionEquality().equals(other.members, members) &&
            const DeepCollectionEquality().equals(other.admins, admins) &&
            const DeepCollectionEquality().equals(other.updatedBy, updatedBy) &&
            const DeepCollectionEquality()
                .equals(other.membersUserData, membersUserData) &&
            const DeepCollectionEquality()
                .equals(other.adminsUserData, adminsUserData) &&
            const DeepCollectionEquality().equals(other.creator, creator));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(createdBy),
      const DeepCollectionEquality().hash(members),
      const DeepCollectionEquality().hash(admins),
      const DeepCollectionEquality().hash(updatedBy),
      const DeepCollectionEquality().hash(membersUserData),
      const DeepCollectionEquality().hash(adminsUserData),
      const DeepCollectionEquality().hash(creator));

  @JsonKey(ignore: true)
  @override
  _$HouseholdCopyWith<_Household> get copyWith =>
      __$HouseholdCopyWithImpl<_Household>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HouseholdToJson(this);
  }
}

abstract class _Household extends Household {
  const factory _Household(
      {@JsonKey(ignore: true)
          String? id,
      @JsonKey(name: CREATED_AT, fromJson: DateTimeConverter.dateTimeFromTimestamp, toJson: DateTimeConverter.dateTimeToTimestamp)
          required DateTime createdAt,
      @JsonKey(name: UPDATED_AT, fromJson: DateTimeConverter.dateTimeFromTimestamp, toJson: DateTimeConverter.dateTimeToTimestamp)
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
          User? creator}) = _$_Household;
  const _Household._() : super._();

  factory _Household.fromJson(Map<String, dynamic> json) =
      _$_Household.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get id;
  @override
  @JsonKey(
      name: CREATED_AT,
      fromJson: DateTimeConverter.dateTimeFromTimestamp,
      toJson: DateTimeConverter.dateTimeToTimestamp)
  DateTime get createdAt;
  @override
  @JsonKey(
      name: UPDATED_AT,
      fromJson: DateTimeConverter.dateTimeFromTimestamp,
      toJson: DateTimeConverter.dateTimeToTimestamp)
  DateTime get updatedAt;
  @override
  String get imageUrl;
  @override
  String get name;
  @override
  String get createdBy;
  @override
  List<String> get members;
  @override
  List<String> get admins;
  @override
  String get updatedBy;
  @override
  @JsonKey(defaultValue: <User>[])
  List<User> get membersUserData;
  @override
  @JsonKey(defaultValue: <User>[])
  List<User>? get adminsUserData;
  @override
  @JsonKey(ignore: true)
  User? get creator;
  @override
  @JsonKey(ignore: true)
  _$HouseholdCopyWith<_Household> get copyWith =>
      throw _privateConstructorUsedError;
}
