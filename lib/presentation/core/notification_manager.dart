// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:smart_dish/presentation/widgets/oval_image.dart';

// Project imports:
import 'package:smart_dish/utils/logger.dart';

@lazySingleton
class NotificationManager {
  StreamSubscription? onMessageSubscription;
  StreamSubscription? onMessageOpenedAppSubscription;

  Future<void> configureFirebaseMessaging(
      BuildContext context, ThemeData themeData) async {
    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        if (message != null) {
          logger.d('onBackgroundMessage');
        }
      },
    );

    await onMessageOpenedAppSubscription?.cancel();
    onMessageOpenedAppSubscription =
        FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) {
        logger.d('onMessageOpenedApp');
      },
    );

    await onMessageSubscription?.cancel();
    onMessageSubscription = FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) async {
        logger.d('message received');
        final notification = message.notification;
        if (notification != null) {
          showSimpleNotification(
            ListTile(
              dense: true,
              title: Text(
                notification.title.toString(),
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                notification.body.toString(),
                overflow: TextOverflow.ellipsis,
              ),
              leading: OvalImage(
                message.notification?.android?.imageUrl ?? "",
                emptyIconData: Icons.person,
              ),
              tileColor: themeData.primaryColor,
              onTap: () {},
            ),
            contentPadding: EdgeInsets.zero,
            position: NotificationPosition.top,
            background: Colors.transparent,
            duration: const Duration(seconds: 5),
            slideDismissDirection: DismissDirection.horizontal,
          );
        }
      },
    );
  }
}
