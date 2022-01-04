// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ingredient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$IngredientTearOff {
  const _$IngredientTearOff();

  _Ingredient call(
      {required UniqueKey localId,
      required String name,
      required bool isChecked}) {
    return _Ingredient(
      localId: localId,
      name: name,
      isChecked: isChecked,
    );
  }
}

/// @nodoc
const $Ingredient = _$IngredientTearOff();

/// @nodoc
mixin _$Ingredient {
  UniqueKey get localId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get isChecked => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IngredientCopyWith<Ingredient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientCopyWith<$Res> {
  factory $IngredientCopyWith(
          Ingredient value, $Res Function(Ingredient) then) =
      _$IngredientCopyWithImpl<$Res>;
  $Res call({UniqueKey localId, String name, bool isChecked});
}

/// @nodoc
class _$IngredientCopyWithImpl<$Res> implements $IngredientCopyWith<$Res> {
  _$IngredientCopyWithImpl(this._value, this._then);

  final Ingredient _value;
  // ignore: unused_field
  final $Res Function(Ingredient) _then;

  @override
  $Res call({
    Object? localId = freezed,
    Object? name = freezed,
    Object? isChecked = freezed,
  }) {
    return _then(_value.copyWith(
      localId: localId == freezed
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as UniqueKey,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isChecked: isChecked == freezed
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$IngredientCopyWith<$Res> implements $IngredientCopyWith<$Res> {
  factory _$IngredientCopyWith(
          _Ingredient value, $Res Function(_Ingredient) then) =
      __$IngredientCopyWithImpl<$Res>;
  @override
  $Res call({UniqueKey localId, String name, bool isChecked});
}

/// @nodoc
class __$IngredientCopyWithImpl<$Res> extends _$IngredientCopyWithImpl<$Res>
    implements _$IngredientCopyWith<$Res> {
  __$IngredientCopyWithImpl(
      _Ingredient _value, $Res Function(_Ingredient) _then)
      : super(_value, (v) => _then(v as _Ingredient));

  @override
  _Ingredient get _value => super._value as _Ingredient;

  @override
  $Res call({
    Object? localId = freezed,
    Object? name = freezed,
    Object? isChecked = freezed,
  }) {
    return _then(_Ingredient(
      localId: localId == freezed
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as UniqueKey,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isChecked: isChecked == freezed
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Ingredient extends _Ingredient {
  const _$_Ingredient(
      {required this.localId, required this.name, required this.isChecked})
      : super._();

  @override
  final UniqueKey localId;
  @override
  final String name;
  @override
  final bool isChecked;

  @override
  String toString() {
    return 'Ingredient(localId: $localId, name: $name, isChecked: $isChecked)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Ingredient &&
            const DeepCollectionEquality().equals(other.localId, localId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.isChecked, isChecked));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(localId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(isChecked));

  @JsonKey(ignore: true)
  @override
  _$IngredientCopyWith<_Ingredient> get copyWith =>
      __$IngredientCopyWithImpl<_Ingredient>(this, _$identity);
}

abstract class _Ingredient extends Ingredient {
  const factory _Ingredient(
      {required UniqueKey localId,
      required String name,
      required bool isChecked}) = _$_Ingredient;
  const _Ingredient._() : super._();

  @override
  UniqueKey get localId;
  @override
  String get name;
  @override
  bool get isChecked;
  @override
  @JsonKey(ignore: true)
  _$IngredientCopyWith<_Ingredient> get copyWith =>
      throw _privateConstructorUsedError;
}
