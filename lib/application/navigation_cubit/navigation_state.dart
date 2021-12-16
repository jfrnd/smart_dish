part of 'navigation_cubit.dart';

@freezed
class NavigationState with _$NavigationState {
  const factory NavigationState.initial() = Initial;
  const factory NavigationState.homeSelected() = HomeSelected;
  const factory NavigationState.accountSettingsSelected() =
      AccountSettingsSelected;
  const factory NavigationState.friendsSelected() = FriendsSelected;
}
