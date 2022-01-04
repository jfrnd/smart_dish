// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'dish.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Dish _$DishFromJson(Map<String, dynamic> json) {
  return _Dish.fromJson(json);
}

/// @nodoc
class _$DishTearOff {
  const _$DishTearOff();

  _Dish call(
      {@JsonKey(ignore: true)
          String? id,
      @JsonKey(name: CREATED_AT, fromJson: DateTimeConverter.dateTimeFromTimestamp, toJson: DateTimeConverter.dateTimeToTimestamp)
          required DateTime createdAt,
      @JsonKey(name: UPDATED_AT, fromJson: DateTimeConverter.dateTimeFromTimestamp, toJson: DateTimeConverter.dateTimeToTimestamp)
          required DateTime updatedAt,
      required String imageUrl,
      required String name,
      required String createdBy,
      @JsonKey(name: INGREDIENTS, fromJson: Ingredient.ingredientsFromJson, toJson: Ingredient.ingredientsToJson, defaultValue: <Ingredient>[])
          required List<Ingredient> ingredients,
      @JsonKey(ignore: true)
          User? creator}) {
    return _Dish(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      imageUrl: imageUrl,
      name: name,
      createdBy: createdBy,
      ingredients: ingredients,
      creator: creator,
    );
  }

  Dish fromJson(Map<String, Object?> json) {
    return Dish.fromJson(json);
  }
}

/// @nodoc
const $Dish = _$DishTearOff();

/// @nodoc
mixin _$Dish {
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
  @JsonKey(
      name: INGREDIENTS,
      fromJson: Ingredient.ingredientsFromJson,
      toJson: Ingredient.ingredientsToJson,
      defaultValue: <Ingredient>[])
  List<Ingredient> get ingredients => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  User? get creator => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DishCopyWith<Dish> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DishCopyWith<$Res> {
  factory $DishCopyWith(Dish value, $Res Function(Dish) then) =
      _$DishCopyWithImpl<$Res>;
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
      @JsonKey(name: INGREDIENTS, fromJson: Ingredient.ingredientsFromJson, toJson: Ingredient.ingredientsToJson, defaultValue: <Ingredient>[])
          List<Ingredient> ingredients,
      @JsonKey(ignore: true)
          User? creator});

  $UserCopyWith<$Res>? get creator;
}

/// @nodoc
class _$DishCopyWithImpl<$Res> implements $DishCopyWith<$Res> {
  _$DishCopyWithImpl(this._value, this._then);

  final Dish _value;
  // ignore: unused_field
  final $Res Function(Dish) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? imageUrl = freezed,
    Object? name = freezed,
    Object? createdBy = freezed,
    Object? ingredients = freezed,
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
      ingredients: ingredients == freezed
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
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
abstract class _$DishCopyWith<$Res> implements $DishCopyWith<$Res> {
  factory _$DishCopyWith(_Dish value, $Res Function(_Dish) then) =
      __$DishCopyWithImpl<$Res>;
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
      @JsonKey(name: INGREDIENTS, fromJson: Ingredient.ingredientsFromJson, toJson: Ingredient.ingredientsToJson, defaultValue: <Ingredient>[])
          List<Ingredient> ingredients,
      @JsonKey(ignore: true)
          User? creator});

  @override
  $UserCopyWith<$Res>? get creator;
}

/// @nodoc
class __$DishCopyWithImpl<$Res> extends _$DishCopyWithImpl<$Res>
    implements _$DishCopyWith<$Res> {
  __$DishCopyWithImpl(_Dish _value, $Res Function(_Dish) _then)
      : super(_value, (v) => _then(v as _Dish));

  @override
  _Dish get _value => super._value as _Dish;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? imageUrl = freezed,
    Object? name = freezed,
    Object? createdBy = freezed,
    Object? ingredients = freezed,
    Object? creator = freezed,
  }) {
    return _then(_Dish(
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
      ingredients: ingredients == freezed
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      creator: creator == freezed
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Dish extends _Dish {
  const _$_Dish(
      {@JsonKey(ignore: true)
          this.id,
      @JsonKey(name: CREATED_AT, fromJson: DateTimeConverter.dateTimeFromTimestamp, toJson: DateTimeConverter.dateTimeToTimestamp)
          required this.createdAt,
      @JsonKey(name: UPDATED_AT, fromJson: DateTimeConverter.dateTimeFromTimestamp, toJson: DateTimeConverter.dateTimeToTimestamp)
          required this.updatedAt,
      required this.imageUrl,
      required this.name,
      required this.createdBy,
      @JsonKey(name: INGREDIENTS, fromJson: Ingredient.ingredientsFromJson, toJson: Ingredient.ingredientsToJson, defaultValue: <Ingredient>[])
          required this.ingredients,
      @JsonKey(ignore: true)
          this.creator})
      : super._();

  factory _$_Dish.fromJson(Map<String, dynamic> json) => _$$_DishFromJson(json);

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
  @JsonKey(
      name: INGREDIENTS,
      fromJson: Ingredient.ingredientsFromJson,
      toJson: Ingredient.ingredientsToJson,
      defaultValue: <Ingredient>[])
  final List<Ingredient> ingredients;
  @override
  @JsonKey(ignore: true)
  final User? creator;

  @override
  String toString() {
    return 'Dish(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, imageUrl: $imageUrl, name: $name, createdBy: $createdBy, ingredients: $ingredients, creator: $creator)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Dish &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.createdBy, createdBy) &&
            const DeepCollectionEquality()
                .equals(other.ingredients, ingredients) &&
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
      const DeepCollectionEquality().hash(ingredients),
      const DeepCollectionEquality().hash(creator));

  @JsonKey(ignore: true)
  @override
  _$DishCopyWith<_Dish> get copyWith =>
      __$DishCopyWithImpl<_Dish>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DishToJson(this);
  }
}

abstract class _Dish extends Dish {
  const factory _Dish(
      {@JsonKey(ignore: true)
          String? id,
      @JsonKey(name: CREATED_AT, fromJson: DateTimeConverter.dateTimeFromTimestamp, toJson: DateTimeConverter.dateTimeToTimestamp)
          required DateTime createdAt,
      @JsonKey(name: UPDATED_AT, fromJson: DateTimeConverter.dateTimeFromTimestamp, toJson: DateTimeConverter.dateTimeToTimestamp)
          required DateTime updatedAt,
      required String imageUrl,
      required String name,
      required String createdBy,
      @JsonKey(name: INGREDIENTS, fromJson: Ingredient.ingredientsFromJson, toJson: Ingredient.ingredientsToJson, defaultValue: <Ingredient>[])
          required List<Ingredient> ingredients,
      @JsonKey(ignore: true)
          User? creator}) = _$_Dish;
  const _Dish._() : super._();

  factory _Dish.fromJson(Map<String, dynamic> json) = _$_Dish.fromJson;

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
  @JsonKey(
      name: INGREDIENTS,
      fromJson: Ingredient.ingredientsFromJson,
      toJson: Ingredient.ingredientsToJson,
      defaultValue: <Ingredient>[])
  List<Ingredient> get ingredients;
  @override
  @JsonKey(ignore: true)
  User? get creator;
  @override
  @JsonKey(ignore: true)
  _$DishCopyWith<_Dish> get copyWith => throw _privateConstructorUsedError;
}
