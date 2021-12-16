// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:cloud_functions/cloud_functions.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:firebase_storage/firebase_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i11;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i13;

import '../application/account_editor/account_editor_cubit.dart' as _i24;
import '../application/dish_editor/dish_editor_cubit.dart' as _i16;
import '../application/friend_request_actor/friend_request_actor_cubit.dart'
    as _i17;
import '../application/image_cropper/image_cropper_cubit.dart' as _i21;
import '../application/navigation_cubit/navigation_cubit.dart' as _i12;
import '../application/search_user/search_user_cubit.dart' as _i22;
import '../application/watcher/dish_watcher_cubit.dart' as _i25;
import '../application/watcher/friend_request_watcher_cubit.dart' as _i18;
import '../application/watcher/friend_watcher_cubit.dart' as _i19;
import '../application/watcher/signed_in_user_watcher_cubit.dart' as _i23;
import '../auth/auth_editor_cubit.dart' as _i14;
import '../auth/auth_watcher_cubit.dart' as _i15;
import '../auth/i_auth_repo.dart' as _i7;
import '../domain/dish/i_dish_repo.dart' as _i8;
import '../domain/friend_request/i_friend_request_repo.dart' as _i9;
import '../domain/user/i_account_repo.dart' as _i20;
import '../domain/user/i_friends_repo.dart' as _i10;
import 'firebase_injectable_module.dart' as _i26;
import 'injectable_module.dart' as _i27;

const String _prod = 'prod';
const String _dev = 'dev';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModuleProd = _$FirebaseInjectableModuleProd();
  final firebaseInjectableModuleDev = _$FirebaseInjectableModuleDev();
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.FirebaseAuth>(
      () => firebaseInjectableModuleProd.firebaseAuth,
      registerFor: {_prod});
  gh.lazySingleton<_i3.FirebaseAuth>(
      () => firebaseInjectableModuleDev.firebaseAuth,
      registerFor: {_dev});
  gh.lazySingleton<_i4.FirebaseFirestore>(
      () => firebaseInjectableModuleProd.firestore,
      registerFor: {_prod});
  gh.lazySingleton<_i4.FirebaseFirestore>(
      () => firebaseInjectableModuleDev.firestore,
      registerFor: {_dev});
  gh.lazySingleton<_i5.FirebaseFunctions>(
      () => firebaseInjectableModuleProd.functions,
      registerFor: {_prod});
  gh.lazySingleton<_i5.FirebaseFunctions>(
      () => firebaseInjectableModuleDev.functions,
      registerFor: {_dev});
  gh.lazySingleton<_i6.FirebaseStorage>(
      () => firebaseInjectableModuleProd.storage,
      registerFor: {_prod});
  gh.lazySingleton<_i6.FirebaseStorage>(
      () => firebaseInjectableModuleDev.storage,
      registerFor: {_dev});
  gh.lazySingleton<_i7.IAuthRepo>(
      () => _i7.FirebaseAuthRepo(get<_i3.FirebaseAuth>()));
  gh.lazySingleton<_i8.IDishRepo>(() => _i8.FirebaseDishRepo(
      get<_i4.FirebaseFirestore>(),
      get<_i7.IAuthRepo>(),
      get<_i6.FirebaseStorage>()));
  gh.lazySingleton<_i9.IFriendRequestRepo>(() => _i9.FirebaseFriendRequestRepo(
      get<_i5.FirebaseFunctions>(),
      get<_i7.IAuthRepo>(),
      get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i10.IUserFriendsRepo>(() => _i10.FirebaseFriendsRepo(
      get<_i7.IAuthRepo>(), get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i11.ImagePicker>(() => injectableModule.imagePicker);
  gh.lazySingleton<_i12.NavigationCubit>(() => _i12.NavigationCubit());
  await gh.factoryAsync<_i13.SharedPreferences>(() => injectableModule.prefs,
      preResolve: true);
  gh.factory<_i14.AuthEditorCubit>(
      () => _i14.AuthEditorCubit(get<_i7.IAuthRepo>()));
  gh.factory<_i15.AuthWatcherCubit>(
      () => _i15.AuthWatcherCubit(get<_i7.IAuthRepo>()));
  gh.factory<_i16.DishEditorCubit>(() =>
      _i16.DishEditorCubit(get<_i8.IDishRepo>(), get<_i11.ImagePicker>()));
  gh.factory<_i17.FriendRequestActorCubit>(
      () => _i17.FriendRequestActorCubit(get<_i9.IFriendRequestRepo>()));
  gh.lazySingleton<_i18.FriendRequestWatcherCubit>(
      () => _i18.FriendRequestWatcherCubit(get<_i9.IFriendRequestRepo>()));
  gh.lazySingleton<_i19.FriendWatcherCubit>(
      () => _i19.FriendWatcherCubit(get<_i10.IUserFriendsRepo>()));
  gh.lazySingleton<_i20.IAccountRepo>(() => _i20.FirebaseAccountRepo(
      get<_i7.IAuthRepo>(),
      get<_i4.FirebaseFirestore>(),
      get<_i5.FirebaseFunctions>(),
      get<_i6.FirebaseStorage>()));
  gh.factory<_i21.ImageCropperCubit>(
      () => _i21.ImageCropperCubit(get<_i11.ImagePicker>()));
  gh.factory<_i22.SearchUserCubit>(() => _i22.SearchUserCubit(
      get<_i9.IFriendRequestRepo>(),
      get<_i18.FriendRequestWatcherCubit>(),
      get<_i19.FriendWatcherCubit>(),
      get<_i7.IAuthRepo>()));
  gh.lazySingleton<_i23.SignedInUserWatcherCubit>(
      () => _i23.SignedInUserWatcherCubit(get<_i20.IAccountRepo>()));
  gh.factory<_i24.AccountEditorCubit>(() => _i24.AccountEditorCubit(
      get<_i20.IAccountRepo>(), get<_i11.ImagePicker>()));
  gh.factory<_i25.DishWatcherCubit>(() => _i25.DishWatcherCubit(
      get<_i19.FriendWatcherCubit>(),
      get<_i8.IDishRepo>(),
      get<_i23.SignedInUserWatcherCubit>()));
  return get;
}

class _$FirebaseInjectableModuleProd extends _i26.FirebaseInjectableModuleProd {
}

class _$FirebaseInjectableModuleDev extends _i26.FirebaseInjectableModuleDev {}

class _$InjectableModule extends _i27.InjectableModule {}
