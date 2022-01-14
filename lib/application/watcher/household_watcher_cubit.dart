import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_dish/domain/household/household.dart';
import 'package:smart_dish/domain/household/i_household_repo.dart';
import 'package:smart_dish/domain/watcher/watcher_cubit.dart';

@injectable
class HouseholdWatcherCubit extends Cubit<WatcherState<List<Household>>> {
  HouseholdWatcherCubit(this.repo) : super(const WatcherState.initial());

  final IHouseholdRepo repo;

  StreamSubscription? streamSubscription;

  void watchAllStarted() async {
    emit(const WatcherState.isLoading());

    await streamSubscription?.cancel();

    streamSubscription = repo.watchAll().listen(
          (failureOrHouseholds) => failureOrHouseholds.fold(
            (failure) => emit(WatcherState.loadingFailed(failure)),
            (households) => emit(WatcherState.loadingSuccessful(households)),
          ),
        );
  }

  Future<void> watchStopped() async {
    await streamSubscription?.cancel();
  }
}
