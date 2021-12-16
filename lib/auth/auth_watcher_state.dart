part of 'auth_watcher_cubit.dart';

@freezed
class AuthWatcherState with _$AuthWatcherState {
  const factory AuthWatcherState.initial() = Initial;
  const factory AuthWatcherState.authenticated() = Authenticated;
  const factory AuthWatcherState.unauthenticated() = Unauthenticated;
}
