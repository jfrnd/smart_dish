// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'crud_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CrudFailureTearOff {
  const _$CrudFailureTearOff();

  Firebase firebase(String info) {
    return Firebase(
      info,
    );
  }

  DoesNotExist doesNotExist() {
    return const DoesNotExist();
  }

  StillLoading stillLoading() {
    return const StillLoading();
  }
}

/// @nodoc
const $CrudFailure = _$CrudFailureTearOff();

/// @nodoc
mixin _$CrudFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String info) firebase,
    required TResult Function() doesNotExist,
    required TResult Function() stillLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String info)? firebase,
    TResult Function()? doesNotExist,
    TResult Function()? stillLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String info)? firebase,
    TResult Function()? doesNotExist,
    TResult Function()? stillLoading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Firebase value) firebase,
    required TResult Function(DoesNotExist value) doesNotExist,
    required TResult Function(StillLoading value) stillLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Firebase value)? firebase,
    TResult Function(DoesNotExist value)? doesNotExist,
    TResult Function(StillLoading value)? stillLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Firebase value)? firebase,
    TResult Function(DoesNotExist value)? doesNotExist,
    TResult Function(StillLoading value)? stillLoading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrudFailureCopyWith<$Res> {
  factory $CrudFailureCopyWith(
          CrudFailure value, $Res Function(CrudFailure) then) =
      _$CrudFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$CrudFailureCopyWithImpl<$Res> implements $CrudFailureCopyWith<$Res> {
  _$CrudFailureCopyWithImpl(this._value, this._then);

  final CrudFailure _value;
  // ignore: unused_field
  final $Res Function(CrudFailure) _then;
}

/// @nodoc
abstract class $FirebaseCopyWith<$Res> {
  factory $FirebaseCopyWith(Firebase value, $Res Function(Firebase) then) =
      _$FirebaseCopyWithImpl<$Res>;
  $Res call({String info});
}

/// @nodoc
class _$FirebaseCopyWithImpl<$Res> extends _$CrudFailureCopyWithImpl<$Res>
    implements $FirebaseCopyWith<$Res> {
  _$FirebaseCopyWithImpl(Firebase _value, $Res Function(Firebase) _then)
      : super(_value, (v) => _then(v as Firebase));

  @override
  Firebase get _value => super._value as Firebase;

  @override
  $Res call({
    Object? info = freezed,
  }) {
    return _then(Firebase(
      info == freezed
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Firebase implements Firebase {
  const _$Firebase(this.info);

  @override
  final String info;

  @override
  String toString() {
    return 'CrudFailure.firebase(info: $info)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Firebase &&
            const DeepCollectionEquality().equals(other.info, info));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(info));

  @JsonKey(ignore: true)
  @override
  $FirebaseCopyWith<Firebase> get copyWith =>
      _$FirebaseCopyWithImpl<Firebase>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String info) firebase,
    required TResult Function() doesNotExist,
    required TResult Function() stillLoading,
  }) {
    return firebase(info);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String info)? firebase,
    TResult Function()? doesNotExist,
    TResult Function()? stillLoading,
  }) {
    return firebase?.call(info);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String info)? firebase,
    TResult Function()? doesNotExist,
    TResult Function()? stillLoading,
    required TResult orElse(),
  }) {
    if (firebase != null) {
      return firebase(info);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Firebase value) firebase,
    required TResult Function(DoesNotExist value) doesNotExist,
    required TResult Function(StillLoading value) stillLoading,
  }) {
    return firebase(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Firebase value)? firebase,
    TResult Function(DoesNotExist value)? doesNotExist,
    TResult Function(StillLoading value)? stillLoading,
  }) {
    return firebase?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Firebase value)? firebase,
    TResult Function(DoesNotExist value)? doesNotExist,
    TResult Function(StillLoading value)? stillLoading,
    required TResult orElse(),
  }) {
    if (firebase != null) {
      return firebase(this);
    }
    return orElse();
  }
}

abstract class Firebase implements CrudFailure {
  const factory Firebase(String info) = _$Firebase;

  String get info;
  @JsonKey(ignore: true)
  $FirebaseCopyWith<Firebase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoesNotExistCopyWith<$Res> {
  factory $DoesNotExistCopyWith(
          DoesNotExist value, $Res Function(DoesNotExist) then) =
      _$DoesNotExistCopyWithImpl<$Res>;
}

/// @nodoc
class _$DoesNotExistCopyWithImpl<$Res> extends _$CrudFailureCopyWithImpl<$Res>
    implements $DoesNotExistCopyWith<$Res> {
  _$DoesNotExistCopyWithImpl(
      DoesNotExist _value, $Res Function(DoesNotExist) _then)
      : super(_value, (v) => _then(v as DoesNotExist));

  @override
  DoesNotExist get _value => super._value as DoesNotExist;
}

/// @nodoc

class _$DoesNotExist implements DoesNotExist {
  const _$DoesNotExist();

  @override
  String toString() {
    return 'CrudFailure.doesNotExist()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DoesNotExist);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String info) firebase,
    required TResult Function() doesNotExist,
    required TResult Function() stillLoading,
  }) {
    return doesNotExist();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String info)? firebase,
    TResult Function()? doesNotExist,
    TResult Function()? stillLoading,
  }) {
    return doesNotExist?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String info)? firebase,
    TResult Function()? doesNotExist,
    TResult Function()? stillLoading,
    required TResult orElse(),
  }) {
    if (doesNotExist != null) {
      return doesNotExist();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Firebase value) firebase,
    required TResult Function(DoesNotExist value) doesNotExist,
    required TResult Function(StillLoading value) stillLoading,
  }) {
    return doesNotExist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Firebase value)? firebase,
    TResult Function(DoesNotExist value)? doesNotExist,
    TResult Function(StillLoading value)? stillLoading,
  }) {
    return doesNotExist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Firebase value)? firebase,
    TResult Function(DoesNotExist value)? doesNotExist,
    TResult Function(StillLoading value)? stillLoading,
    required TResult orElse(),
  }) {
    if (doesNotExist != null) {
      return doesNotExist(this);
    }
    return orElse();
  }
}

abstract class DoesNotExist implements CrudFailure {
  const factory DoesNotExist() = _$DoesNotExist;
}

/// @nodoc
abstract class $StillLoadingCopyWith<$Res> {
  factory $StillLoadingCopyWith(
          StillLoading value, $Res Function(StillLoading) then) =
      _$StillLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$StillLoadingCopyWithImpl<$Res> extends _$CrudFailureCopyWithImpl<$Res>
    implements $StillLoadingCopyWith<$Res> {
  _$StillLoadingCopyWithImpl(
      StillLoading _value, $Res Function(StillLoading) _then)
      : super(_value, (v) => _then(v as StillLoading));

  @override
  StillLoading get _value => super._value as StillLoading;
}

/// @nodoc

class _$StillLoading implements StillLoading {
  const _$StillLoading();

  @override
  String toString() {
    return 'CrudFailure.stillLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is StillLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String info) firebase,
    required TResult Function() doesNotExist,
    required TResult Function() stillLoading,
  }) {
    return stillLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String info)? firebase,
    TResult Function()? doesNotExist,
    TResult Function()? stillLoading,
  }) {
    return stillLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String info)? firebase,
    TResult Function()? doesNotExist,
    TResult Function()? stillLoading,
    required TResult orElse(),
  }) {
    if (stillLoading != null) {
      return stillLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Firebase value) firebase,
    required TResult Function(DoesNotExist value) doesNotExist,
    required TResult Function(StillLoading value) stillLoading,
  }) {
    return stillLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Firebase value)? firebase,
    TResult Function(DoesNotExist value)? doesNotExist,
    TResult Function(StillLoading value)? stillLoading,
  }) {
    return stillLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Firebase value)? firebase,
    TResult Function(DoesNotExist value)? doesNotExist,
    TResult Function(StillLoading value)? stillLoading,
    required TResult orElse(),
  }) {
    if (stillLoading != null) {
      return stillLoading(this);
    }
    return orElse();
  }
}

abstract class StillLoading implements CrudFailure {
  const factory StillLoading() = _$StillLoading;
}
