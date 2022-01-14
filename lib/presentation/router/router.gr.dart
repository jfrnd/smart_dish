// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;

import '../../domain/dish/dish.dart' as _i14;
import '../../domain/household/household.dart' as _i15;
import '../auth/pages/email_verify_waiting_page.dart' as _i3;
import '../auth/pages/sign_in_page.dart' as _i2;
import '../core/splash_page.dart' as _i1;
import '../dish/create_update_dish_page.dart' as _i10;
import '../friends/friends_page.dart' as _i6;
import '../friends/search_users_page.dart' as _i9;
import '../home_page.dart' as _i4;
import '../households/create_update_household_page.dart' as _i11;
import '../households/household_list_page.dart' as _i7;
import '../households/household_page.dart' as _i8;
import '../user/pages/account_settings_page.dart' as _i5;

class AppRouter extends _i12.RootStackRouter {
  AppRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    SignInRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignInPage());
    },
    EmailVerifyWaitingRoute.name: (routeData) {
      final args = routeData.argsAs<EmailVerifyWaitingRouteArgs>();
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.EmailVerifyWaitingPage(key: args.key, email: args.email));
    },
    HomeRoute.name: (routeData) {
      return _i12.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i4.HomePage(),
          opaque: true,
          barrierDismissible: false);
    },
    AccountSettingsRoute.name: (routeData) {
      return _i12.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i5.AccountSettingsPage(),
          opaque: true,
          barrierDismissible: false);
    },
    FriendsRoute.name: (routeData) {
      return _i12.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i6.FriendsPage(),
          opaque: true,
          barrierDismissible: false);
    },
    HouseholdListRoute.name: (routeData) {
      return _i12.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i7.HouseholdListPage(),
          opaque: true,
          barrierDismissible: false);
    },
    HouseholdRoute.name: (routeData) {
      final args = routeData.argsAs<HouseholdRouteArgs>();
      return _i12.CustomPage<dynamic>(
          routeData: routeData,
          child:
              _i8.HouseholdPage(key: args.key, householdId: args.householdId),
          opaque: true,
          barrierDismissible: false);
    },
    SearchUsersRoute.name: (routeData) {
      return _i12.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i9.SearchUsersPage(),
          opaque: true,
          barrierDismissible: false);
    },
    CreateUpdateDishRoute.name: (routeData) {
      final args = routeData.argsAs<CreateUpdateDishRouteArgs>(
          orElse: () => const CreateUpdateDishRouteArgs());
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.CreateUpdateDishPage(key: args.key, dish: args.dish));
    },
    CreateUpdateHouseholdRoute.name: (routeData) {
      final args = routeData.argsAs<CreateUpdateHouseholdRouteArgs>(
          orElse: () => const CreateUpdateHouseholdRouteArgs());
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.CreateUpdateHouseholdPage(
              key: args.key, household: args.household));
    }
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(SplashRoute.name, path: '/'),
        _i12.RouteConfig(SignInRoute.name, path: '/sign-in-page'),
        _i12.RouteConfig(EmailVerifyWaitingRoute.name,
            path: '/email-verify-waiting-page'),
        _i12.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i12.RouteConfig(AccountSettingsRoute.name,
            path: '/account-settings-page'),
        _i12.RouteConfig(FriendsRoute.name, path: '/friends-page'),
        _i12.RouteConfig(HouseholdListRoute.name, path: '/household-list-page'),
        _i12.RouteConfig(HouseholdRoute.name, path: '/household-page'),
        _i12.RouteConfig(SearchUsersRoute.name, path: '/search-users-page'),
        _i12.RouteConfig(CreateUpdateDishRoute.name,
            path: '/create-update-dish-page'),
        _i12.RouteConfig(CreateUpdateHouseholdRoute.name,
            path: '/create-update-household-page')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i12.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.SignInPage]
class SignInRoute extends _i12.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '/sign-in-page');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i3.EmailVerifyWaitingPage]
class EmailVerifyWaitingRoute
    extends _i12.PageRouteInfo<EmailVerifyWaitingRouteArgs> {
  EmailVerifyWaitingRoute({_i13.Key? key, required String email})
      : super(EmailVerifyWaitingRoute.name,
            path: '/email-verify-waiting-page',
            args: EmailVerifyWaitingRouteArgs(key: key, email: email));

  static const String name = 'EmailVerifyWaitingRoute';
}

class EmailVerifyWaitingRouteArgs {
  const EmailVerifyWaitingRouteArgs({this.key, required this.email});

  final _i13.Key? key;

  final String email;

  @override
  String toString() {
    return 'EmailVerifyWaitingRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-page');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.AccountSettingsPage]
class AccountSettingsRoute extends _i12.PageRouteInfo<void> {
  const AccountSettingsRoute()
      : super(AccountSettingsRoute.name, path: '/account-settings-page');

  static const String name = 'AccountSettingsRoute';
}

/// generated route for
/// [_i6.FriendsPage]
class FriendsRoute extends _i12.PageRouteInfo<void> {
  const FriendsRoute() : super(FriendsRoute.name, path: '/friends-page');

  static const String name = 'FriendsRoute';
}

/// generated route for
/// [_i7.HouseholdListPage]
class HouseholdListRoute extends _i12.PageRouteInfo<void> {
  const HouseholdListRoute()
      : super(HouseholdListRoute.name, path: '/household-list-page');

  static const String name = 'HouseholdListRoute';
}

/// generated route for
/// [_i8.HouseholdPage]
class HouseholdRoute extends _i12.PageRouteInfo<HouseholdRouteArgs> {
  HouseholdRoute({_i13.Key? key, required String householdId})
      : super(HouseholdRoute.name,
            path: '/household-page',
            args: HouseholdRouteArgs(key: key, householdId: householdId));

  static const String name = 'HouseholdRoute';
}

class HouseholdRouteArgs {
  const HouseholdRouteArgs({this.key, required this.householdId});

  final _i13.Key? key;

  final String householdId;

  @override
  String toString() {
    return 'HouseholdRouteArgs{key: $key, householdId: $householdId}';
  }
}

/// generated route for
/// [_i9.SearchUsersPage]
class SearchUsersRoute extends _i12.PageRouteInfo<void> {
  const SearchUsersRoute()
      : super(SearchUsersRoute.name, path: '/search-users-page');

  static const String name = 'SearchUsersRoute';
}

/// generated route for
/// [_i10.CreateUpdateDishPage]
class CreateUpdateDishRoute
    extends _i12.PageRouteInfo<CreateUpdateDishRouteArgs> {
  CreateUpdateDishRoute({_i13.Key? key, _i14.Dish? dish})
      : super(CreateUpdateDishRoute.name,
            path: '/create-update-dish-page',
            args: CreateUpdateDishRouteArgs(key: key, dish: dish));

  static const String name = 'CreateUpdateDishRoute';
}

class CreateUpdateDishRouteArgs {
  const CreateUpdateDishRouteArgs({this.key, this.dish});

  final _i13.Key? key;

  final _i14.Dish? dish;

  @override
  String toString() {
    return 'CreateUpdateDishRouteArgs{key: $key, dish: $dish}';
  }
}

/// generated route for
/// [_i11.CreateUpdateHouseholdPage]
class CreateUpdateHouseholdRoute
    extends _i12.PageRouteInfo<CreateUpdateHouseholdRouteArgs> {
  CreateUpdateHouseholdRoute({_i13.Key? key, _i15.Household? household})
      : super(CreateUpdateHouseholdRoute.name,
            path: '/create-update-household-page',
            args:
                CreateUpdateHouseholdRouteArgs(key: key, household: household));

  static const String name = 'CreateUpdateHouseholdRoute';
}

class CreateUpdateHouseholdRouteArgs {
  const CreateUpdateHouseholdRouteArgs({this.key, this.household});

  final _i13.Key? key;

  final _i15.Household? household;

  @override
  String toString() {
    return 'CreateUpdateHouseholdRouteArgs{key: $key, household: $household}';
  }
}
