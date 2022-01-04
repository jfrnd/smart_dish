// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:cloud_functions/cloud_functions.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:firebase_messaging/firebase_messaging.dart' as _i6;
import 'package:firebase_storage/firebase_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i12;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i15;

import '../application/account_editor/account_editor_cubit.dart' as _i26;
import '../application/dish_editor/dish_editor_cubit.dart' as _i18;
import '../application/friend_actor/friend_actor_cubit.dart' as _i19;
import '../application/image_cropper/image_cropper_cubit.dart' as _i23;
import '../application/navigation_cubit/navigation_cubit.dart' as _i13;
import '../application/search_user/search_user_cubit.dart' as _i24;
import '../application/watcher/dish_watcher_cubit.dart' as _i27;
import '../application/watcher/friend_request_cubit.dart' as _i20;
import '../application/watcher/friend_watcher_cubit.dart' as _i21;
import '../application/watcher/signed_in_user_watcher_cubit.dart' as _i25;
import '../auth/auth_editor_cubit.dart' as _i16;
import '../auth/auth_watcher_cubit.dart' as _i17;
import '../auth/i_auth_repo.dart' as _i8;
import '../domain/dish/i_dish_repo.dart' as _i9;
import '../domain/friend_request/i_friend_request_repo.dart' as _i10;
import '../domain/user/i_account_repo.dart' as _i22;
import '../domain/user/i_friends_repo.dart' as _i11;
import '../presentation/core/notification_manager.dart' as _i14;
import 'firebase_injectable_module.dart' as _i28;
import 'injectable_module.dart' as _i29;

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
  gh.lazySingleton<_i6.FirebaseMessaging>(
      () => firebaseInjectableModuleProd.messaging);
  gh.lazySingleton<_i7.FirebaseStorage>(
      () => firebaseInjectableModuleProd.storage,
      registerFor: {_prod});
  gh.lazySingleton<_i7.FirebaseStorage>(
      () => firebaseInjectableModuleDev.storage,
      registerFor: {_dev});
  gh.lazySingleton<_i8.IAuthRepo>(() => _i8.FirebaseAuthRepo(
      get<_i3.FirebaseAuth>(),
      get<_i6.FirebaseMessaging>(),
      get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i9.IDishRepo>(() => _i9.FirebaseDishRepo(
      get<_i4.FirebaseFirestore>(),
      get<_i8.IAuthRepo>(),
      get<_i7.FirebaseStorage>()));
  gh.lazySingleton<_i10.IFriendRequestRepo>(() =>
      _i10.FirebaseFriendRequestRepo(get<_i5.FirebaseFunctions>(),
          get<_i8.IAuthRepo>(), get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i11.IUserFriendsRepo>(() => _i11.FirebaseFriendsRepo(
      get<_i8.IAuthRepo>(), get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i12.ImagePicker>(() => injectableModule.imagePicker);
  gh.lazySingleton<_i13.NavigationCubit>(() => _i13.NavigationCubit());
  gh.lazySingleton<_i14.NotificationManager>(() => _i14.NotificationManager());
  await gh.factoryAsync<_i15.SharedPreferences>(() => injectableModule.prefs,
      preResolve: true);
  gh.factory<_i16.AuthEditorCubit>(
      () => _i16.AuthEditorCubit(get<_i8.IAuthRepo>()));
  gh.factory<_i17.AuthWatcherCubit>(
      () => _i17.AuthWatcherCubit(get<_i8.IAuthRepo>()));
  gh.factory<_i18.DishEditorCubit>(() => _i18.DishEditorCubit(
      get<_i9.IDishRepo>(), get<_i12.ImagePicker>(), get<_i8.IAuthRepo>()));
  gh.factory<_i19.FriendActorCubit>(
      () => _i19.FriendActorCubit(get<_i10.IFriendRequestRepo>()));
  gh.lazySingleton<_i20.FriendRequestCubit>(
      () => _i20.FriendRequestCubit(get<_i10.IFriendRequestRepo>()));
  gh.lazySingleton<_i21.FriendWatcherCubit>(
      () => _i21.FriendWatcherCubit(get<_i11.IUserFriendsRepo>()));
  gh.lazySingleton<_i22.IAccountRepo>(() => _i22.FirebaseAccountRepo(
      get<_i8.IAuthRepo>(),
      get<_i4.FirebaseFirestore>(),
      get<_i5.FirebaseFunctions>(),
      get<_i7.FirebaseStorage>()));
  gh.factory<_i23.ImageCropperCubit>(
      () => _i23.ImageCropperCubit(get<_i12.ImagePicker>()));
  gh.factory<_i24.SearchUserCubit>(() => _i24.SearchUserCubit(
      get<_i10.IFriendRequestRepo>(),
      get<_i20.FriendRequestCubit>(),
      get<_i21.FriendWatcherCubit>(),
      get<_i8.IAuthRepo>()));
  gh.lazySingleton<_i25.SignedInUserWatcherCubit>(
      () => _i25.SignedInUserWatcherCubit(get<_i22.IAccountRepo>()));
  gh.factory<_i26.AccountEditorCubit>(
      () => _i26.AccountEditorCubit(get<_i22.IAccountRepo>()));
  gh.factory<_i27.DishWatcherCubit>(() => _i27.DishWatcherCubit(
      get<_i21.FriendWatcherCubit>(),
      get<_i9.IDishRepo>(),
      get<_i25.SignedInUserWatcherCubit>()));
  return get;
}

class _$FirebaseInjectableModuleProd extends _i28.FirebaseInjectableModuleProd {
}

class _$FirebaseInjectableModuleDev extends _i28.FirebaseInjectableModuleDev {}

class _$InjectableModule extends _i29.InjectableModule {}
