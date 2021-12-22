import 'dart:ui';

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:smart_dish/presentation/router/router.gr.dart';
import 'package:smart_dish/utils/app_bloc_observer.dart';
import 'package:smart_dish/utils/logger.dart';
import 'package:smart_dish/web_test_page.dart';
import 'application/navigation_cubit/navigation_cubit.dart';
import 'application/watcher/dish_watcher_cubit.dart';
import 'application/watcher/friend_request_cubit.dart';
import 'application/watcher/friend_watcher_cubit.dart';
import 'application/watcher/signed_in_user_watcher_cubit.dart';
import 'auth/auth_watcher_cubit.dart';
// ignore: unused_import
import 'auth/i_auth_repo.dart';
import 'di/injection.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'presentation/core/notification_manager.dart';

const environment = Environment.dev;
const devicePreview = false;
const webHotReloadTest = false;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  logger.d('Handling a background message ${message.messageId}');
}

late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await configureInjection(environment);
  if (environment == Environment.dev) {
    //if there is data with invalid data schema in cache
    // await getIt<FirebaseFirestore>().clearPersistence();
    // await getIt<IAuthRepo>().signOut();
  }

  if (!kIsWeb) {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  BlocOverrides.runZoned(
    () => runApp(
      devicePreview
          ? DevicePreview(
              enabled: !kReleaseMode && !kIsWeb,
              builder: (context) => AppWidget(),
            )
          : AppWidget(),
    ),
    blocObserver: AppBlocObserver(),
  );
}

class AppWidget extends StatelessWidget {
  final _appRouter = AppRouter();

  AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = ThemeData(
      primaryColor: Colors.lightGreen,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.lightGreen),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
    );

    getIt<NotificationManager>().configureFirebaseMessaging(context, themeData);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<AuthWatcherCubit>()),
        BlocProvider(create: (_) => getIt<FriendWatcherCubit>()),
        BlocProvider(create: (_) => getIt<FriendRequestCubit>()),
        BlocProvider(create: (_) => getIt<SignedInUserWatcherCubit>()),
        BlocProvider(create: (_) => getIt<DishWatcherCubit>()),
        BlocProvider(create: (_) => getIt<NavigationCubit>()),
      ],
      child: webHotReloadTest && kIsWeb
          ? WebTest(themeData)
          : OverlaySupport.global(
              child: MaterialApp.router(
                builder: DevicePreview.appBuilder,
                useInheritedMediaQuery: true,
                locale: DevicePreview.locale(context),
                routerDelegate: _appRouter.delegate(),
                routeInformationParser: _appRouter.defaultRouteParser(),
                title: 'SmartDish',
                debugShowCheckedModeBanner: false,
                theme: themeData,
                scrollBehavior: MyCustomScrollBehavior(),
              ),
            ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
