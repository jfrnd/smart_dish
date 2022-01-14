// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'household_editor_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HouseholdEditorStateTearOff {
  const _$HouseholdEditorStateTearOff();

  _Initial call(
      {required bool isLoading,
      required bool isCreatingNewHousehold,
      required bool isInEditMode,
      required bool hasPermissionToUpdate,
      required bool isCreator,
      required bool showErrorMessages,
      required List<User> membersPool,
      required Either<CrudFailure, Unit>? failureOrSuccess,
      required Household household,
      required Uint8List? image}) {
    return _Initial(
      isLoading: isLoading,
      isCreatingNewHousehold: isCreatingNewHousehold,
      isInEditMode: isInEditMode,
      hasPermissionToUpdate: hasPermissionToUpdate,
      isCreator: isCreator,
      showErrorMessages: showErrorMessages,
      membersPool: membersPool,
      failureOrSuccess: failureOrSuccess,
      household: household,
      image: image,
    );
  }
}

/// @nodoc
const $HouseholdEditorState = _$HouseholdEditorStateTearOff();

/// @nodoc
mixin _$HouseholdEditorState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isCreatingNewHousehold => throw _privateConstructorUsedError;
  bool get isInEditMode => throw _privateConstructorUsedError;
  bool get hasPermissionToUpdate => throw _privateConstructorUsedError;
  bool get isCreator => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  List<User> get membersPool => throw _privateConstructorUsedError;
  Either<CrudFailure, Unit>? get failureOrSuccess =>
      throw _privateConstructorUsedError;
  Household get household => throw _privateConstructorUsedError;
  Uint8List? get image => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HouseholdEditorStateCopyWith<HouseholdEditorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HouseholdEditorStateCopyWith<$Res> {
  factory $HouseholdEditorStateCopyWith(HouseholdEditorState value,
          $Res Function(HouseholdEditorState) then) =
      _$HouseholdEditorStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      bool isCreatingNewHousehold,
      bool isInEditMode,
      bool hasPermissionToUpdate,
      bool isCreator,
      bool showErrorMessages,
      List<User> membersPool,
      Either<CrudFailure, Unit>? failureOrSuccess,
      Household household,
      Uint8List? image});

  $HouseholdCopyWith<$Res> get household;
}

/// @nodoc
class _$HouseholdEditorStateCopyWithImpl<$Res>
    implements $HouseholdEditorStateCopyWith<$Res> {
  _$HouseholdEditorStateCopyWithImpl(this._value, this._then);

  final HouseholdEditorState _value;
  // ignore: unused_field
  final $Res Function(HouseholdEditorState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isCreatingNewHousehold = freezed,
    Object? isInEditMode = freezed,
    Object? hasPermissionToUpdate = freezed,
    Object? isCreator = freezed,
    Object? showErrorMessages = freezed,
    Object? membersPool = freezed,
    Object? failureOrSuccess = freezed,
    Object? household = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreatingNewHousehold: isCreatingNewHousehold == freezed
          ? _value.isCreatingNewHousehold
          : isCreatingNewHousehold // ignore: cast_nullable_to_non_nullable
              as bool,
      isInEditMode: isInEditMode == freezed
          ? _value.isInEditMode
          : isInEditMode // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPermissionToUpdate: hasPermissionToUpdate == freezed
          ? _value.hasPermissionToUpdate
          : hasPermissionToUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreator: isCreator == freezed
          ? _value.isCreator
          : isCreator // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      membersPool: membersPool == freezed
          ? _value.membersPool
          : membersPool // ignore: cast_nullable_to_non_nullable
              as List<User>,
      failureOrSuccess: failureOrSuccess == freezed
          ? _value.failureOrSuccess
          : failureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Either<CrudFailure, Unit>?,
      household: household == freezed
          ? _value.household
          : household // ignore: cast_nullable_to_non_nullable
              as Household,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }

  @override
  $HouseholdCopyWith<$Res> get household {
    return $HouseholdCopyWith<$Res>(_value.household, (value) {
      return _then(_value.copyWith(household: value));
    });
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res>
    implements $HouseholdEditorStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      bool isCreatingNewHousehold,
      bool isInEditMode,
      bool hasPermissionToUpdate,
      bool isCreator,
      bool showErrorMessages,
      List<User> membersPool,
      Either<CrudFailure, Unit>? failureOrSuccess,
      Household household,
      Uint8List? image});

  @override
  $HouseholdCopyWith<$Res> get household;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$HouseholdEditorStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isCreatingNewHousehold = freezed,
    Object? isInEditMode = freezed,
    Object? hasPermissionToUpdate = freezed,
    Object? isCreator = freezed,
    Object? showErrorMessages = freezed,
    Object? membersPool = freezed,
    Object? failureOrSuccess = freezed,
    Object? household = freezed,
    Object? image = freezed,
  }) {
    return _then(_Initial(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreatingNewHousehold: isCreatingNewHousehold == freezed
          ? _value.isCreatingNewHousehold
          : isCreatingNewHousehold // ignore: cast_nullable_to_non_nullable
              as bool,
      isInEditMode: isInEditMode == freezed
          ? _value.isInEditMode
          : isInEditMode // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPermissionToUpdate: hasPermissionToUpdate == freezed
          ? _value.hasPermissionToUpdate
          : hasPermissionToUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreator: isCreator == freezed
          ? _value.isCreator
          : isCreator // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      membersPool: membersPool == freezed
          ? _value.membersPool
          : membersPool // ignore: cast_nullable_to_non_nullable
              as List<User>,
      failureOrSuccess: failureOrSuccess == freezed
          ? _value.failureOrSuccess
          : failureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Either<CrudFailure, Unit>?,
      household: household == freezed
          ? _value.household
          : household // ignore: cast_nullable_to_non_nullable
              as Household,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required this.isLoading,
      required this.isCreatingNewHousehold,
      required this.isInEditMode,
      required this.hasPermissionToUpdate,
      required this.isCreator,
      required this.showErrorMessages,
      required this.membersPool,
      required this.failureOrSuccess,
      required this.household,
      required this.image});

  @override
  final bool isLoading;
  @override
  final bool isCreatingNewHousehold;
  @override
  final bool isInEditMode;
  @override
  final bool hasPermissionToUpdate;
  @override
  final bool isCreator;
  @override
  final bool showErrorMessages;
  @override
  final List<User> membersPool;
  @override
  final Either<CrudFailure, Unit>? failureOrSuccess;
  @override
  final Household household;
  @override
  final Uint8List? image;

  @override
  String toString() {
    return 'HouseholdEditorState(isLoading: $isLoading, isCreatingNewHousehold: $isCreatingNewHousehold, isInEditMode: $isInEditMode, hasPermissionToUpdate: $hasPermissionToUpdate, isCreator: $isCreator, showErrorMessages: $showErrorMessages, membersPool: $membersPool, failureOrSuccess: $failureOrSuccess, household: $household, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initial &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isCreatingNewHousehold, isCreatingNewHousehold) &&
            const DeepCollectionEquality()
                .equals(other.isInEditMode, isInEditMode) &&
            const DeepCollectionEquality()
                .equals(other.hasPermissionToUpdate, hasPermissionToUpdate) &&
            const DeepCollectionEquality().equals(other.isCreator, isCreator) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality()
                .equals(other.membersPool, membersPool) &&
            const DeepCollectionEquality()
                .equals(other.failureOrSuccess, failureOrSuccess) &&
            const DeepCollectionEquality().equals(other.household, household) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isCreatingNewHousehold),
      const DeepCollectionEquality().hash(isInEditMode),
      const DeepCollectionEquality().hash(hasPermissionToUpdate),
      const DeepCollectionEquality().hash(isCreator),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(membersPool),
      const DeepCollectionEquality().hash(failureOrSuccess),
      const DeepCollectionEquality().hash(household),
      const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);
}

abstract class _Initial implements HouseholdEditorState {
  const factory _Initial(
      {required bool isLoading,
      required bool isCreatingNewHousehold,
      required bool isInEditMode,
      required bool hasPermissionToUpdate,
      required bool isCreator,
      required bool showErrorMessages,
      required List<User> membersPool,
      required Either<CrudFailure, Unit>? failureOrSuccess,
      required Household household,
      required Uint8List? image}) = _$_Initial;

  @override
  bool get isLoading;
  @override
  bool get isCreatingNewHousehold;
  @override
  bool get isInEditMode;
  @override
  bool get hasPermissionToUpdate;
  @override
  bool get isCreator;
  @override
  bool get showErrorMessages;
  @override
  List<User> get membersPool;
  @override
  Either<CrudFailure, Unit>? get failureOrSuccess;
  @override
  Household get household;
  @override
  Uint8List? get image;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
