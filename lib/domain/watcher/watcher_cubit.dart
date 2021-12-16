import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dish/domain/core/crud_failure.dart';

import 'i_watcher_repo.dart';

part 'watcher_state.dart';
part 'watcher_cubit.freezed.dart';

class WatcherCubit<T> extends Cubit<WatcherState<T>> {
  WatcherCubit(this.repo) : super(const WatcherState.initial());

  final IWatcherRepo<T> repo;

  StreamSubscription<Either<CrudFailure, T>>? streamSubscription;

  @override
  Future<void> close() async {
    await streamSubscription?.cancel();
    return super.close();
  }

  void watchAllStarted() async {
    emit(const WatcherState.isLoading());

    await streamSubscription?.cancel();

    streamSubscription = repo.watchAll().listen(
      (failureOrData) {
        failureOrData.fold(
          (failure) => emit(WatcherState.loadingFailed(failure)),
          (data) => emit(WatcherState.loadingSuccessful(data)),
        );
      },
    );
  }

  Future<void> watchStopped() async {
    await streamSubscription?.cancel();
  }
}
