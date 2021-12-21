part of 'search_user_cubit.dart';

@freezed
class SearchUserState with _$SearchUserState {
  const factory SearchUserState.initial() = Initial;
  const factory SearchUserState.isLoading() = IsLoading;
  const factory SearchUserState.loadingFailed(CrudFailure failure) =
      LoadingFailed;
  const factory SearchUserState.loadingSuccessful(List<User> users) =
      LoadingSuccessful;
}
