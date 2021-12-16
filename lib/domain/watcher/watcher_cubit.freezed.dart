// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'watcher_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$WatcherStateTearOff {
  const _$WatcherStateTearOff();

  _Initial<T> initial<T>() {
    return _Initial<T>();
  }

  _IsLoading<T> isLoading<T>() {
    return _IsLoading<T>();
  }

  LoadingFailed<T> loadingFailed<T>(CrudFailure failure) {
    return LoadingFailed<T>(
      failure,
    );
  }

  LoadingSuccessful<T> loadingSuccessful<T>(T data) {
    return LoadingSuccessful<T>(
      data,
    );
  }
}

/// @nodoc
const $WatcherState = _$WatcherStateTearOff();

/// @nodoc
mixin _$WatcherState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(CrudFailure failure) loadingFailed,
    required TResult Function(T data) loadingSuccessful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(CrudFailure failure)? loadingFailed,
    TResult Function(T data)? loadingSuccessful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(CrudFailure failure)? loadingFailed,
    TResult Function(T data)? loadingSuccessful,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_IsLoading<T> value) isLoading,
    required TResult Function(LoadingFailed<T> value) loadingFailed,
    required TResult Function(LoadingSuccessful<T> value) loadingSuccessful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_IsLoading<T> value)? isLoading,
    TResult Function(LoadingFailed<T> value)? loadingFailed,
    TResult Function(LoadingSuccessful<T> value)? loadingSuccessful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_IsLoading<T> value)? isLoading,
    TResult Function(LoadingFailed<T> value)? loadingFailed,
    TResult Function(LoadingSuccessful<T> value)? loadingSuccessful,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatcherStateCopyWith<T, $Res> {
  factory $WatcherStateCopyWith(
          WatcherState<T> value, $Res Function(WatcherState<T>) then) =
      _$WatcherStateCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$WatcherStateCopyWithImpl<T, $Res>
    implements $WatcherStateCopyWith<T, $Res> {
  _$WatcherStateCopyWithImpl(this._value, this._then);

  final WatcherState<T> _value;
  // ignore: unused_field
  final $Res Function(WatcherState<T>) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<T, $Res> {
  factory _$InitialCopyWith(
          _Initial<T> value, $Res Function(_Initial<T>) then) =
      __$InitialCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<T, $Res>
    extends _$WatcherStateCopyWithImpl<T, $Res>
    implements _$InitialCopyWith<T, $Res> {
  __$InitialCopyWithImpl(_Initial<T> _value, $Res Function(_Initial<T>) _then)
      : super(_value, (v) => _then(v as _Initial<T>));

  @override
  _Initial<T> get _value => super._value as _Initial<T>;
}

/// @nodoc

class _$_Initial<T> implements _Initial<T> {
  const _$_Initial();

  @override
  String toString() {
    return 'WatcherState<$T>.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(CrudFailure failure) loadingFailed,
    required TResult Function(T data) loadingSuccessful,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(CrudFailure failure)? loadingFailed,
    TResult Function(T data)? loadingSuccessful,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(CrudFailure failure)? loadingFailed,
    TResult Function(T data)? loadingSuccessful,
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
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_IsLoading<T> value) isLoading,
    required TResult Function(LoadingFailed<T> value) loadingFailed,
    required TResult Function(LoadingSuccessful<T> value) loadingSuccessful,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_IsLoading<T> value)? isLoading,
    TResult Function(LoadingFailed<T> value)? loadingFailed,
    TResult Function(LoadingSuccessful<T> value)? loadingSuccessful,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_IsLoading<T> value)? isLoading,
    TResult Function(LoadingFailed<T> value)? loadingFailed,
    TResult Function(LoadingSuccessful<T> value)? loadingSuccessful,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements WatcherState<T> {
  const factory _Initial() = _$_Initial<T>;
}

/// @nodoc
abstract class _$IsLoadingCopyWith<T, $Res> {
  factory _$IsLoadingCopyWith(
          _IsLoading<T> value, $Res Function(_IsLoading<T>) then) =
      __$IsLoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$IsLoadingCopyWithImpl<T, $Res>
    extends _$WatcherStateCopyWithImpl<T, $Res>
    implements _$IsLoadingCopyWith<T, $Res> {
  __$IsLoadingCopyWithImpl(
      _IsLoading<T> _value, $Res Function(_IsLoading<T>) _then)
      : super(_value, (v) => _then(v as _IsLoading<T>));

  @override
  _IsLoading<T> get _value => super._value as _IsLoading<T>;
}

/// @nodoc

class _$_IsLoading<T> implements _IsLoading<T> {
  const _$_IsLoading();

  @override
  String toString() {
    return 'WatcherState<$T>.isLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _IsLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(CrudFailure failure) loadingFailed,
    required TResult Function(T data) loadingSuccessful,
  }) {
    return isLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(CrudFailure failure)? loadingFailed,
    TResult Function(T data)? loadingSuccessful,
  }) {
    return isLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(CrudFailure failure)? loadingFailed,
    TResult Function(T data)? loadingSuccessful,
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
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_IsLoading<T> value) isLoading,
    required TResult Function(LoadingFailed<T> value) loadingFailed,
    required TResult Function(LoadingSuccessful<T> value) loadingSuccessful,
  }) {
    return isLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_IsLoading<T> value)? isLoading,
    TResult Function(LoadingFailed<T> value)? loadingFailed,
    TResult Function(LoadingSuccessful<T> value)? loadingSuccessful,
  }) {
    return isLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_IsLoading<T> value)? isLoading,
    TResult Function(LoadingFailed<T> value)? loadingFailed,
    TResult Function(LoadingSuccessful<T> value)? loadingSuccessful,
    required TResult orElse(),
  }) {
    if (isLoading != null) {
      return isLoading(this);
    }
    return orElse();
  }
}

abstract class _IsLoading<T> implements WatcherState<T> {
  const factory _IsLoading() = _$_IsLoading<T>;
}

/// @nodoc
abstract class $LoadingFailedCopyWith<T, $Res> {
  factory $LoadingFailedCopyWith(
          LoadingFailed<T> value, $Res Function(LoadingFailed<T>) then) =
      _$LoadingFailedCopyWithImpl<T, $Res>;
  $Res call({CrudFailure failure});

  $CrudFailureCopyWith<$Res> get failure;
}

/// @nodoc
class _$LoadingFailedCopyWithImpl<T, $Res>
    extends _$WatcherStateCopyWithImpl<T, $Res>
    implements $LoadingFailedCopyWith<T, $Res> {
  _$LoadingFailedCopyWithImpl(
      LoadingFailed<T> _value, $Res Function(LoadingFailed<T>) _then)
      : super(_value, (v) => _then(v as LoadingFailed<T>));

  @override
  LoadingFailed<T> get _value => super._value as LoadingFailed<T>;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(LoadingFailed<T>(
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

class _$LoadingFailed<T> implements LoadingFailed<T> {
  const _$LoadingFailed(this.failure);

  @override
  final CrudFailure failure;

  @override
  String toString() {
    return 'WatcherState<$T>.loadingFailed(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadingFailed<T> &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  $LoadingFailedCopyWith<T, LoadingFailed<T>> get copyWith =>
      _$LoadingFailedCopyWithImpl<T, LoadingFailed<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(CrudFailure failure) loadingFailed,
    required TResult Function(T data) loadingSuccessful,
  }) {
    return loadingFailed(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(CrudFailure failure)? loadingFailed,
    TResult Function(T data)? loadingSuccessful,
  }) {
    return loadingFailed?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(CrudFailure failure)? loadingFailed,
    TResult Function(T data)? loadingSuccessful,
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
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_IsLoading<T> value) isLoading,
    required TResult Function(LoadingFailed<T> value) loadingFailed,
    required TResult Function(LoadingSuccessful<T> value) loadingSuccessful,
  }) {
    return loadingFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_IsLoading<T> value)? isLoading,
    TResult Function(LoadingFailed<T> value)? loadingFailed,
    TResult Function(LoadingSuccessful<T> value)? loadingSuccessful,
  }) {
    return loadingFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_IsLoading<T> value)? isLoading,
    TResult Function(LoadingFailed<T> value)? loadingFailed,
    TResult Function(LoadingSuccessful<T> value)? loadingSuccessful,
    required TResult orElse(),
  }) {
    if (loadingFailed != null) {
      return loadingFailed(this);
    }
    return orElse();
  }
}

abstract class LoadingFailed<T> implements WatcherState<T> {
  const factory LoadingFailed(CrudFailure failure) = _$LoadingFailed<T>;

  CrudFailure get failure;
  @JsonKey(ignore: true)
  $LoadingFailedCopyWith<T, LoadingFailed<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadingSuccessfulCopyWith<T, $Res> {
  factory $LoadingSuccessfulCopyWith(LoadingSuccessful<T> value,
          $Res Function(LoadingSuccessful<T>) then) =
      _$LoadingSuccessfulCopyWithImpl<T, $Res>;
  $Res call({T data});
}

/// @nodoc
class _$LoadingSuccessfulCopyWithImpl<T, $Res>
    extends _$WatcherStateCopyWithImpl<T, $Res>
    implements $LoadingSuccessfulCopyWith<T, $Res> {
  _$LoadingSuccessfulCopyWithImpl(
      LoadingSuccessful<T> _value, $Res Function(LoadingSuccessful<T>) _then)
      : super(_value, (v) => _then(v as LoadingSuccessful<T>));

  @override
  LoadingSuccessful<T> get _value => super._value as LoadingSuccessful<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(LoadingSuccessful<T>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$LoadingSuccessful<T> implements LoadingSuccessful<T> {
  const _$LoadingSuccessful(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'WatcherState<$T>.loadingSuccessful(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadingSuccessful<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  $LoadingSuccessfulCopyWith<T, LoadingSuccessful<T>> get copyWith =>
      _$LoadingSuccessfulCopyWithImpl<T, LoadingSuccessful<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(CrudFailure failure) loadingFailed,
    required TResult Function(T data) loadingSuccessful,
  }) {
    return loadingSuccessful(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(CrudFailure failure)? loadingFailed,
    TResult Function(T data)? loadingSuccessful,
  }) {
    return loadingSuccessful?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(CrudFailure failure)? loadingFailed,
    TResult Function(T data)? loadingSuccessful,
    required TResult orElse(),
  }) {
    if (loadingSuccessful != null) {
      return loadingSuccessful(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_IsLoading<T> value) isLoading,
    required TResult Function(LoadingFailed<T> value) loadingFailed,
    required TResult Function(LoadingSuccessful<T> value) loadingSuccessful,
  }) {
    return loadingSuccessful(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_IsLoading<T> value)? isLoading,
    TResult Function(LoadingFailed<T> value)? loadingFailed,
    TResult Function(LoadingSuccessful<T> value)? loadingSuccessful,
  }) {
    return loadingSuccessful?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_IsLoading<T> value)? isLoading,
    TResult Function(LoadingFailed<T> value)? loadingFailed,
    TResult Function(LoadingSuccessful<T> value)? loadingSuccessful,
    required TResult orElse(),
  }) {
    if (loadingSuccessful != null) {
      return loadingSuccessful(this);
    }
    return orElse();
  }
}

abstract class LoadingSuccessful<T> implements WatcherState<T> {
  const factory LoadingSuccessful(T data) = _$LoadingSuccessful<T>;

  T get data;
  @JsonKey(ignore: true)
  $LoadingSuccessfulCopyWith<T, LoadingSuccessful<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
