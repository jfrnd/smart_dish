// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../../domain/dish/dish.dart' as _i11;
import '../auth/pages/email_verify_waiting_page.dart' as _i3;
import '../auth/pages/sign_in_page.dart' as _i2;
import '../core/splash_page.dart' as _i1;
import '../dish/create_update_dish_page.dart' as _i8;
import '../friends/friends_page.dart' as _i6;
import '../friends/search_users_page.dart' as _i7;
import '../home_page.dart' as _i4;
import '../user/pages/account_settings_page.dart' as _i5;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    SignInRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignInPage());
    },
    EmailVerifyWaitingRoute.name: (routeData) {
      final args = routeData.argsAs<EmailVerifyWaitingRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.EmailVerifyWaitingPage(key: args.key, email: args.email));
    },
    HomeRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i4.HomePage(),
          opaque: true,
          barrierDismissible: false);
    },
    AccountSettingsRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i5.AccountSettingsPage(),
          opaque: true,
          barrierDismissible: false);
    },
    FriendsRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i6.FriendsPage(),
          opaque: true,
          barrierDismissible: false);
    },
    SearchUsersRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i7.SearchUsersPage(),
          opaque: true,
          barrierDismissible: false);
    },
    CreateUpdateDishRoute.name: (routeData) {
      final args = routeData.argsAs<CreateUpdateDishRouteArgs>(
          orElse: () => const CreateUpdateDishRouteArgs());
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.CreateUpdateDishPage(key: args.key, dish: args.dish));
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(SplashRoute.name, path: '/'),
        _i9.RouteConfig(SignInRoute.name, path: '/sign-in-page'),
        _i9.RouteConfig(EmailVerifyWaitingRoute.name,
            path: '/email-verify-waiting-page'),
        _i9.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i9.RouteConfig(AccountSettingsRoute.name,
            path: '/account-settings-page'),
        _i9.RouteConfig(FriendsRoute.name, path: '/friends-page'),
        _i9.RouteConfig(SearchUsersRoute.name, path: '/search-users-page'),
        _i9.RouteConfig(CreateUpdateDishRoute.name,
            path: '/create-update-dish-page')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.SignInPage]
class SignInRoute extends _i9.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '/sign-in-page');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i3.EmailVerifyWaitingPage]
class EmailVerifyWaitingRoute
    extends _i9.PageRouteInfo<EmailVerifyWaitingRouteArgs> {
  EmailVerifyWaitingRoute({_i10.Key? key, required String email})
      : super(EmailVerifyWaitingRoute.name,
            path: '/email-verify-waiting-page',
            args: EmailVerifyWaitingRouteArgs(key: key, email: email));

  static const String name = 'EmailVerifyWaitingRoute';
}

class EmailVerifyWaitingRouteArgs {
  const EmailVerifyWaitingRouteArgs({this.key, required this.email});

  final _i10.Key? key;

  final String email;

  @override
  String toString() {
    return 'EmailVerifyWaitingRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-page');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.AccountSettingsPage]
class AccountSettingsRoute extends _i9.PageRouteInfo<void> {
  const AccountSettingsRoute()
      : super(AccountSettingsRoute.name, path: '/account-settings-page');

  static const String name = 'AccountSettingsRoute';
}

/// generated route for
/// [_i6.FriendsPage]
class FriendsRoute extends _i9.PageRouteInfo<void> {
  const FriendsRoute() : super(FriendsRoute.name, path: '/friends-page');

  static const String name = 'FriendsRoute';
}

/// generated route for
/// [_i7.SearchUsersPage]
class SearchUsersRoute extends _i9.PageRouteInfo<void> {
  const SearchUsersRoute()
      : super(SearchUsersRoute.name, path: '/search-users-page');

  static const String name = 'SearchUsersRoute';
}

/// generated route for
/// [_i8.CreateUpdateDishPage]
class CreateUpdateDishRoute
    extends _i9.PageRouteInfo<CreateUpdateDishRouteArgs> {
  CreateUpdateDishRoute({_i10.Key? key, _i11.Dish? dish})
      : super(CreateUpdateDishRoute.name,
            path: '/create-update-dish-page',
            args: CreateUpdateDishRouteArgs(key: key, dish: dish));

  static const String name = 'CreateUpdateDishRoute';
}

class CreateUpdateDishRouteArgs {
  const CreateUpdateDishRouteArgs({this.key, this.dish});

  final _i10.Key? key;

  final _i11.Dish? dish;

  @override
  String toString() {
    return 'CreateUpdateDishRouteArgs{key: $key, dish: $dish}';
  }
}
