import 'package:auto_route/annotations.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smart_dish/presentation/auth/pages/email_verify_waiting_page.dart';
import 'package:smart_dish/presentation/auth/pages/sign_in_page.dart';
import 'package:smart_dish/presentation/core/splash_page.dart';
import 'package:smart_dish/presentation/create_update_dish_page.dart';
import 'package:smart_dish/presentation/friends/friends_page.dart';
import 'package:smart_dish/presentation/friends/search_users_page.dart';
import 'package:smart_dish/presentation/user/pages/account_settings_page.dart';

import '../home_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: SignInPage),
    AutoRoute(page: EmailVerifyWaitingPage),
    CustomRoute(page: HomePage),
    CustomRoute(page: AccountSettingsPage),
    CustomRoute(page: FriendsPage),
    CustomRoute(page: SearchUsersPage),
    AutoRoute(page: CreateUpdateDishPage),
  ],
)
class $AppRouter {}

Widget zoomInTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  // you get an animation object and a widget
  // make your own transition
  return ScaleTransition(scale: animation, child: child);
}

Widget fadeInTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  // you get an animation object and a widget
  // make your own transition
  return FadeTransition(opacity: animation, child: child);
}
