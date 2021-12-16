// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_user_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SearchUserStateTearOff {
  const _$SearchUserStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _IsLoading isLoading() {
    return const _IsLoading();
  }

  _LoadingFailed loadingFailed(CrudFailure failure) {
    return _LoadingFailed(
      failure,
    );
  }

  _LoadingSuccessful loadingSuccessful(List<User> users) {
    return _LoadingSuccessful(
      users,
    );
  }
}

/// @nodoc
const $SearchUserState = _$SearchUserStateTearOff();

/// @nodoc
mixin _$SearchUserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(CrudFailure failure) loadingFailed,
    required TResult Function(List<User> users) loadingSuccessful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(CrudFailure failure)? loadingFailed,
    TResult Function(List<User> users)? loadingSuccessful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(CrudFailure failure)? loadingFailed,
    TResult Function(List<User> users)? loadingSuccessful,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_LoadingFailed value) loadingFailed,
    required TResult Function(_LoadingSuccessful value) loadingSuccessful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_LoadingFailed value)? loadingFailed,
    TResult Function(_LoadingSuccessful value)? loadingSuccessful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_LoadingFailed value)? loadingFailed,
    TResult Function(_LoadingSuccessful value)? loadingSuccessful,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchUserStateCopyWith<$Res> {
  factory $SearchUserStateCopyWith(
          SearchUserState value, $Res Function(SearchUserState) then) =
      _$SearchUserStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SearchUserStateCopyWithImpl<$Res>
    implements $SearchUserStateCopyWith<$Res> {
  _$SearchUserStateCopyWithImpl(this._value, this._then);

  final SearchUserState _value;
  // ignore: unused_field
  final $Res Function(SearchUserState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$SearchUserStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'SearchUserState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(CrudFailure failure) loadingFailed,
    required TResult Function(List<User> users) loadingSuccessful,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(CrudFailure failure)? loadingFailed,
    TResult Function(List<User> users)? loadingSuccessful,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(CrudFailure failure)? loadingFailed,
    TResult Function(List<User> users)? loadingSuccessful,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_LoadingFailed value) loadingFailed,
    required TResult Function(_LoadingSuccessful value) loadingSuccessful,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_LoadingFailed value)? loadingFailed,
    TResult Function(_LoadingSuccessful value)? loadingSuccessful,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_LoadingFailed value)? loadingFailed,
    TResult Function(_LoadingSuccessful value)? loadingSuccessful,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SearchUserState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$IsLoadingCopyWith<$Res> {
  factory _$IsLoadingCopyWith(
          _IsLoading value, $Res Function(_IsLoading) then) =
      __$IsLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$IsLoadingCopyWithImpl<$Res> extends _$SearchUserStateCopyWithImpl<$Res>
    implements _$IsLoadingCopyWith<$Res> {
  __$IsLoadingCopyWithImpl(_IsLoading _value, $Res Function(_IsLoading) _then)
      : super(_value, (v) => _then(v as _IsLoading));

  @override
  _IsLoading get _value => super._value as _IsLoading;
}

/// @nodoc

class _$_IsLoading implements _IsLoading {
  const _$_IsLoading();

  @override
  String toString() {
    return 'SearchUserState.isLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _IsLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(CrudFailure failure) loadingFailed,
    required TResult Function(List<User> users) loadingSuccessful,
  }) {
    return isLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(CrudFailure failure)? loadingFailed,
    TResult Function(List<User> users)? loadingSuccessful,
  }) {
    return isLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(CrudFailure failure)? loadingFailed,
    TResult Function(List<User> users)? loadingSuccessful,
    required TResult orElse(),
  }) {
    if (isLoading != null) {
      return isLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_LoadingFailed value) loadingFailed,
    required TResult Function(_LoadingSuccessful value) loadingSuccessful,
  }) {
    return isLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_LoadingFailed value)? loadingFailed,
    TResult Function(_LoadingSuccessful value)? loadingSuccessful,
  }) {
    return isLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_LoadingFailed value)? loadingFailed,
    TResult Function(_LoadingSuccessful value)? loadingSuccessful,
    required TResult orElse(),
  }) {
    if (isLoading != null) {
      return isLoading(this);
    }
    return orElse();
  }
}

abstract class _IsLoading implements SearchUserState {
  const factory _IsLoading() = _$_IsLoading;
}

/// @nodoc
abstract class _$LoadingFailedCopyWith<$Res> {
  factory _$LoadingFailedCopyWith(
          _LoadingFailed value, $Res Function(_LoadingFailed) then) =
      __$LoadingFailedCopyWithImpl<$Res>;
  $Res call({CrudFailure failure});

  $CrudFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$LoadingFailedCopyWithImpl<$Res>
    extends _$SearchUserStateCopyWithImpl<$Res>
    implements _$LoadingFailedCopyWith<$Res> {
  __$LoadingFailedCopyWithImpl(
      _LoadingFailed _value, $Res Function(_LoadingFailed) _then)
      : super(_value, (v) => _then(v as _LoadingFailed));

  @override
  _LoadingFailed get _value => super._value as _LoadingFailed;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_LoadingFailed(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as CrudFailure,
    ));
  }

  @override
  $CrudFailureCopyWith<$Res> get failure {
    return $CrudFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_LoadingFailed implements _LoadingFailed {
  const _$_LoadingFailed(this.failure);

  @override
  final CrudFailure failure;

  @override
  String toString() {
    return 'SearchUserState.loadingFailed(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadingFailed &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  _$LoadingFailedCopyWith<_LoadingFailed> get copyWith =>
      __$LoadingFailedCopyWithImpl<_LoadingFailed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(CrudFailure failure) loadingFailed,
    required TResult Function(List<User> users) loadingSuccessful,
  }) {
    return loadingFailed(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(CrudFailure failure)? loadingFailed,
    TResult Function(List<User> users)? loadingSuccessful,
  }) {
    return loadingFailed?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(CrudFailure failure)? loadingFailed,
    TResult Function(List<User> users)? loadingSuccessful,
    required TResult orElse(),
  }) {
    if (loadingFailed != null) {
      return loadingFailed(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_LoadingFailed value) loadingFailed,
    required TResult Function(_LoadingSuccessful value) loadingSuccessful,
  }) {
    return loadingFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_LoadingFailed value)? loadingFailed,
    TResult Function(_LoadingSuccessful value)? loadingSuccessful,
  }) {
    return loadingFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_LoadingFailed value)? loadingFailed,
    TResult Function(_LoadingSuccessful value)? loadingSuccessful,
    required TResult orElse(),
  }) {
    if (loadingFailed != null) {
      return loadingFailed(this);
    }
    return orElse();
  }
}

abstract class _LoadingFailed implements SearchUserState {
  const factory _LoadingFailed(CrudFailure failure) = _$_LoadingFailed;

  CrudFailure get failure;
  @JsonKey(ignore: true)
  _$LoadingFailedCopyWith<_LoadingFailed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadingSuccessfulCopyWith<$Res> {
  factory _$LoadingSuccessfulCopyWith(
          _LoadingSuccessful value, $Res Function(_LoadingSuccessful) then) =
      __$LoadingSuccessfulCopyWithImpl<$Res>;
  $Res call({List<User> users});
}

/// @nodoc
class __$LoadingSuccessfulCopyWithImpl<$Res>
    extends _$SearchUserStateCopyWithImpl<$Res>
    implements _$LoadingSuccessfulCopyWith<$Res> {
  __$LoadingSuccessfulCopyWithImpl(
      _LoadingSuccessful _value, $Res Function(_LoadingSuccessful) _then)
      : super(_value, (v) => _then(v as _LoadingSuccessful));

  @override
  _LoadingSuccessful get _value => super._value as _LoadingSuccessful;

  @override
  $Res call({
    Object? users = freezed,
  }) {
    return _then(_LoadingSuccessful(
      users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ));
  }
}

/// @nodoc

class _$_LoadingSuccessful implements _LoadingSuccessful {
  const _$_LoadingSuccessful(this.users);

  @override
  final List<User> users;

  @override
  String toString() {
    return 'SearchUserState.loadingSuccessful(users: $users)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadingSuccessful &&
            const DeepCollectionEquality().equals(other.users, users));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(users));

  @JsonKey(ignore: true)
  @override
  _$LoadingSuccessfulCopyWith<_LoadingSuccessful> get copyWith =>
      __$LoadingSuccessfulCopyWithImpl<_LoadingSuccessful>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(CrudFailure failure) loadingFailed,
    required TResult Function(List<User> users) loadingSuccessful,
  }) {
    return loadingSuccessful(users);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(CrudFailure failure)? loadingFailed,
    TResult Function(List<User> users)? loadingSuccessful,
  }) {
    return loadingSuccessful?.call(users);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(CrudFailure failure)? loadingFailed,
    TResult Function(List<User> users)? loadingSuccessful,
    required TResult orElse(),
  }) {
    if (loadingSuccessful != null) {
      return loadingSuccessful(users);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_LoadingFailed value) loadingFailed,
    required TResult Function(_LoadingSuccessful value) loadingSuccessful,
  }) {
    return loadingSuccessful(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_LoadingFailed value)? loadingFailed,
    TResult Function(_LoadingSuccessful value)? loadingSuccessful,
  }) {
    return loadingSuccessful?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_LoadingFailed value)? loadingFailed,
    TResult Function(_LoadingSuccessful value)? loadingSuccessful,
    required TResult orElse(),
  }) {
    if (loadingSuccessful != null) {
      return loadingSuccessful(this);
    }
    return orElse();
  }
}

abstract class _LoadingSuccessful implements SearchUserState {
  const factory _LoadingSuccessful(List<User> users) = _$_LoadingSuccessful;

  List<User> get users;
  @JsonKey(ignore: true)
  _$LoadingSuccessfulCopyWith<_LoadingSuccessful> get copyWith =>
      throw _privateConstructorUsedError;
}
