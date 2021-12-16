part of 'watcher_cubit.dart';

@freezed
class WatcherState<T> with _$WatcherState<T> {
  const factory WatcherState.initial() = _Initial;
  const factory WatcherState.isLoading() = _IsLoading;
  const factory WatcherState.loadingFailed(CrudFailure failure) =
      LoadingFailed;
  const factory WatcherState.loadingSuccessful(T data) = LoadingSuccessful;
}
