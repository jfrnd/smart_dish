part of 'search_user_cubit.dart';

@freezed
class SearchUserState with _$SearchUserState {
  const factory SearchUserState.initial() = _Initial;
  const factory SearchUserState.isLoading() = _IsLoading;
  const factory SearchUserState.loadingFailed(CrudFailure failure) =
      _LoadingFailed;
  const factory SearchUserState.loadingSuccessful(List<User> users) =
      _LoadingSuccessful;
}
