import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_dish/auth/auth_failure.dart';
import 'package:smart_dish/auth/i_auth_repo.dart';

part 'auth_watcher_state.dart';
part 'auth_watcher_cubit.freezed.dart';

@injectable
class AuthWatcherCubit extends Cubit<AuthWatcherState> {
  final IAuthRepo _authRepo;

  StreamSubscription<Either<AuthFailure, Unit>>? _streamSubscription;
  Timer? timer;

  AuthWatcherCubit(this._authRepo) : super(const AuthWatcherState.initial()) {
    _streamSubscription = _authRepo.watchUserState().listen(
          (authFailureOrUnit) => authFailureOrUnit.fold(
            (failure) => emit(const AuthWatcherState.unauthenticated()),
            (unit) => emit(const AuthWatcherState.authenticated()),
          ),
        );
  }

  void manuallyReloadUser() => _authRepo.manuallyReloadUser();

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();
    return super.close();
  }

  void signedOut() => _authRepo.signOut();
}
