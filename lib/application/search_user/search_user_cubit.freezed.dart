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

  Initial initial() {
    return const Initial();
  }

  IsLoading isLoading() {
    return const IsLoading();
  }

  LoadingFailed loadingFailed(CrudFailure failure) {
    return LoadingFailed(
      failure,
    );
  }

  LoadingSuccessful loadingSuccessful(List<User> users) {
    return LoadingSuccessful(
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
    required TResult Function(Initial value) initial,
    required TResult Function(IsLoading value) isLoading,
    required TResult Function(LoadingFailed value) loadingFailed,
    required TResult Function(LoadingSuccessful value) loadingSuccessful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(IsLoading value)? isLoading,
    TResult Function(LoadingFailed value)? loadingFailed,
    TResult Function(LoadingSuccessful value)? loadingSuccessful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(IsLoading value)? isLoading,
    TResult Function(LoadingFailed value)? loadingFailed,
    TResult Function(LoadingSuccessful value)? loadingSuccessful,
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
abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialCopyWithImpl<$Res> extends _$SearchUserStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'SearchUserState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Initial);
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
    required TResult Function(Initial value) initial,
    required TResult Function(IsLoading value) isLoading,
    required TResult Function(LoadingFailed value) loadingFailed,
    required TResult Function(LoadingSuccessful value) loadingSuccessful,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(IsLoading value)? isLoading,
    TResult Function(LoadingFailed value)? loadingFailed,
    TResult Function(LoadingSuccessful value)? loadingSuccessful,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(IsLoading value)? isLoading,
    TResult Function(LoadingFailed value)? loadingFailed,
    TResult Function(LoadingSuccessful value)? loadingSuccessful,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements SearchUserState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class $IsLoadingCopyWith<$Res> {
  factory $IsLoadingCopyWith(IsLoading value, $Res Function(IsLoading) then) =
      _$IsLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$IsLoadingCopyWithImpl<$Res> extends _$SearchUserStateCopyWithImpl<$Res>
    implements $IsLoadingCopyWith<$Res> {
  _$IsLoadingCopyWithImpl(IsLoading _value, $Res Function(IsLoading) _then)
      : super(_value, (v) => _then(v as IsLoading));

  @override
  IsLoading get _value => super._value as IsLoading;
}

/// @nodoc

class _$IsLoading implements IsLoading {
  const _$IsLoading();

  @override
  String toString() {
    return 'SearchUserState.isLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is IsLoading);
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
    required TResult Function(Initial value) initial,
    required TResult Function(IsLoading value) isLoading,
    required TResult Function(LoadingFailed value) loadingFailed,
    required TResult Function(LoadingSuccessful value) loadingSuccessful,
  }) {
    return isLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(IsLoading value)? isLoading,
    TResult Function(LoadingFailed value)? loadingFailed,
    TResult Function(LoadingSuccessful value)? loadingSuccessful,
  }) {
    return isLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(IsLoading value)? isLoading,
    TResult Function(LoadingFailed value)? loadingFailed,
    TResult Function(LoadingSuccessful value)? loadingSuccessful,
    required TResult orElse(),
  }) {
    if (isLoading != null) {
      return isLoading(this);
    }
    return orElse();
  }
}

abstract class IsLoading implements SearchUserState {
  const factory IsLoading() = _$IsLoading;
}

/// @nodoc
abstract class $LoadingFailedCopyWith<$Res> {
  factory $LoadingFailedCopyWith(
          LoadingFailed value, $Res Function(LoadingFailed) then) =
      _$LoadingFailedCopyWithImpl<$Res>;
  $Res call({CrudFailure failure});

  $CrudFailureCopyWith<$Res> get failure;
}

/// @nodoc
class _$LoadingFailedCopyWithImpl<$Res>
    extends _$SearchUserStateCopyWithImpl<$Res>
    implements $LoadingFailedCopyWith<$Res> {
  _$LoadingFailedCopyWithImpl(
      LoadingFailed _value, $Res Function(LoadingFailed) _then)
      : super(_value, (v) => _then(v as LoadingFailed));

  @override
  LoadingFailed get _value => super._value as LoadingFailed;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(LoadingFailed(
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

class _$LoadingFailed implements LoadingFailed {
  const _$LoadingFailed(this.failure);

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
            other is LoadingFailed &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  $LoadingFailedCopyWith<LoadingFailed> get copyWith =>
      _$LoadingFailedCopyWithImpl<LoadingFailed>(this, _$identity);

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
    required TResult Function(Initial value) initial,
    required TResult Function(IsLoading value) isLoading,
    required TResult Function(LoadingFailed value) loadingFailed,
    required TResult Function(LoadingSuccessful value) loadingSuccessful,
  }) {
    return loadingFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(IsLoading value)? isLoading,
    TResult Function(LoadingFailed value)? loadingFailed,
    TResult Function(LoadingSuccessful value)? loadingSuccessful,
  }) {
    return loadingFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(IsLoading value)? isLoading,
    TResult Function(LoadingFailed value)? loadingFailed,
    TResult Function(LoadingSuccessful value)? loadingSuccessful,
    required TResult orElse(),
  }) {
    if (loadingFailed != null) {
      return loadingFailed(this);
    }
    return orElse();
  }
}

abstract class LoadingFailed implements SearchUserState {
  const factory LoadingFailed(CrudFailure failure) = _$LoadingFailed;

  CrudFailure get failure;
  @JsonKey(ignore: true)
  $LoadingFailedCopyWith<LoadingFailed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadingSuccessfulCopyWith<$Res> {
  factory $LoadingSuccessfulCopyWith(
          LoadingSuccessful value, $Res Function(LoadingSuccessful) then) =
      _$LoadingSuccessfulCopyWithImpl<$Res>;
  $Res call({List<User> users});
}

/// @nodoc
class _$LoadingSuccessfulCopyWithImpl<$Res>
    extends _$SearchUserStateCopyWithImpl<$Res>
    implements $LoadingSuccessfulCopyWith<$Res> {
  _$LoadingSuccessfulCopyWithImpl(
      LoadingSuccessful _value, $Res Function(LoadingSuccessful) _then)
      : super(_value, (v) => _then(v as LoadingSuccessful));

  @override
  LoadingSuccessful get _value => super._value as LoadingSuccessful;

  @override
  $Res call({
    Object? users = freezed,
  }) {
    return _then(LoadingSuccessful(
      users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ));
  }
}

/// @nodoc

class _$LoadingSuccessful implements LoadingSuccessful {
  const _$LoadingSuccessful(this.users);

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
            other is LoadingSuccessful &&
            const DeepCollectionEquality().equals(other.users, users));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(users));

  @JsonKey(ignore: true)
  @override
  $LoadingSuccessfulCopyWith<LoadingSuccessful> get copyWith =>
      _$LoadingSuccessfulCopyWithImpl<LoadingSuccessful>(this, _$identity);

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
    required TResult Function(Initial value) initial,
    required TResult Function(IsLoading value) isLoading,
    required TResult Function(LoadingFailed value) loadingFailed,
    required TResult Function(LoadingSuccessful value) loadingSuccessful,
  }) {
    return loadingSuccessful(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(IsLoading value)? isLoading,
    TResult Function(LoadingFailed value)? loadingFailed,
    TResult Function(LoadingSuccessful value)? loadingSuccessful,
  }) {
    return loadingSuccessful?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(IsLoading value)? isLoading,
    TResult Function(LoadingFailed value)? loadingFailed,
    TResult Function(LoadingSuccessful value)? loadingSuccessful,
    required TResult orElse(),
  }) {
    if (loadingSuccessful != null) {
      return loadingSuccessful(this);
    }
    return orElse();
  }
}

abstract class LoadingSuccessful implements SearchUserState {
  const factory LoadingSuccessful(List<User> users) = _$LoadingSuccessful;

  List<User> get users;
  @JsonKey(ignore: true)
  $LoadingSuccessfulCopyWith<LoadingSuccessful> get copyWith =>
      throw _privateConstructorUsedError;
}
