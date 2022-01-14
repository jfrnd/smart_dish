import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dish/application/navigation_cubit/navigation_cubit.dart';
import 'package:smart_dish/application/watcher/dish_watcher_cubit.dart';
import 'package:smart_dish/application/watcher/friend_request_cubit.dart';
import 'package:smart_dish/application/watcher/friend_watcher_cubit.dart';
import 'package:smart_dish/application/watcher/household_watcher_cubit.dart';
import 'package:smart_dish/application/watcher/signed_in_user_watcher_cubit.dart';
import 'package:smart_dish/auth/auth_watcher_cubit.dart';

extension ContextX on BuildContext {
  String readSignedInUserId() {
    return read<SignedInUserWatcherCubit>().state.maybeMap(
        orElse: () => "", loadingSuccessful: (state) => state.data.id ?? "");
  }

  void triggerWatcherCubits() {
    read<AuthWatcherCubit>().updateToken();
    read<FriendWatcherCubit>().watchAllStarted();
    read<FriendRequestCubit>().watchAllStarted();
    read<SignedInUserWatcherCubit>().watchAllStarted();
    read<DishWatcherCubit>().watchAllStarted();
    read<HouseholdWatcherCubit>().watchAllStarted();
    read<NavigationCubit>().homeSelected();
  }

  void resetWatcherCubits() {
    read<FriendWatcherCubit>().watchStopped();
    read<FriendRequestCubit>().watchStopped();
    read<SignedInUserWatcherCubit>().watchStopped();
    read<DishWatcherCubit>().watchStopped();
    read<HouseholdWatcherCubit>().watchStopped();
  }
}
