import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_dish/application/watcher/signed_in_user_watcher_cubit.dart';
import 'package:smart_dish/domain/core/crud_failure.dart';
import 'package:smart_dish/domain/dish/dish.dart';
import 'package:smart_dish/domain/dish/i_dish_repo.dart';
import 'package:smart_dish/domain/user/user.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_dish/domain/watcher/watcher_cubit.dart';

import 'friend_watcher_cubit.dart';

@injectable
class DishWatcherCubit extends Cubit<WatcherState<List<Dish>>> {
  DishWatcherCubit(
      this._friendsWatcherCubit, this.repo, this._signedInUserWatcherCubit)
      : super(const WatcherState.initial());

  final FriendWatcherCubit _friendsWatcherCubit;
  final SignedInUserWatcherCubit _signedInUserWatcherCubit;
  final IDishRepo repo;

  StreamSubscription? streamSubscription;

  void watchAllStarted() async {
    emit(const WatcherState.isLoading());

    await streamSubscription?.cancel();

    streamSubscription = _friendsWatcherCubit.stream
        .startWith(_friendsWatcherCubit.state)
        .switchMap(
          (_state) => _state.maybeMap(
            orElse: () => Stream.value(
              left<CrudFailure, List<User>>(const CrudFailure.stillLoading()),
            ),
            loadingFailed: (_state) => Stream.value(
              left<CrudFailure, List<User>>(_state.failure),
            ),
            loadingSuccessful: (_state) => Stream.value(
              right<CrudFailure, List<User>>(_state.data),
            ),
          ),
        )
        .switchMap(
          (failureOrUsers) => failureOrUsers.fold(
            (failure) => Stream.value(left<CrudFailure, List<User>>(failure)),
            (users) => _signedInUserWatcherCubit.stream
                .startWith(_signedInUserWatcherCubit.state)
                .switchMap(
                  (_state) => _state.maybeMap(
                    orElse: () => Stream.value(left<CrudFailure, List<User>>(
                        const CrudFailure.stillLoading())),
                    loadingFailed: (_state) => Stream.value(
                        left<CrudFailure, List<User>>(_state.failure)),
                    loadingSuccessful: (_state) => Stream.value(
                      right<CrudFailure, List<User>>(users + [_state.data]),
                    ),
                  ),
                ),
          ),
        )
        .switchMap(
          (failureOrUsers) => failureOrUsers.fold(
            (failure) => Stream.value(left<CrudFailure, List<Dish>>(failure)),
            (users) => repo.watchDishes(users),
          ),
        )
        .listen(
          (failureOrDishes) => failureOrDishes.fold(
            (failure) => failure == const CrudFailure.stillLoading()
                ? emit(const WatcherState.isLoading())
                : emit(WatcherState.loadingFailed(failure)),
            (dishes) => emit(WatcherState.loadingSuccessful(dishes)),
          ),
        );
  }

  Future<void> watchStopped() async {
    await streamSubscription?.cancel();
  }
}
