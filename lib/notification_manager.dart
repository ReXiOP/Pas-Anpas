import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationManager {
  static final _plugin = FlutterLocalNotificationsPlugin();

  static Future initialize() async {
    // Use the default launcher icon for notifications
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await _plugin.initialize(initializationSettings);
  }

  static Future showNotification(String title, String body) async {
    const androidChannelSpecifics = AndroidNotificationDetails(
      'high_importance_channel', // Channel ID
      'High Importance Notifications', // Channel name
      importance: Importance.max,
      priority: Priority.high,
    );
    const platformChannelSpecifics =
        NotificationDetails(android: androidChannelSpecifics);
    await _plugin.show(0, title, body, platformChannelSpecifics);
  }
}
