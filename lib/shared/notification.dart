import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'package:flutter_timezone/flutter_timezone.dart';

class LocalNotificationService1 {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static onTap(NotificationResponse NotificationResponse) {}

  static Future init() async {
    InitializationSettings settings = const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }

//Basic Notification
  static void showBasicNotification(String not,String body) async {
    NotificationDetails details = const NotificationDetails(
        android: AndroidNotificationDetails("Id_0", "Basic Notification",
            importance: Importance.max, priority: Priority.high));
    await flutterLocalNotificationsPlugin.show(
        0, not, body, details);
  }

//Repeated Notification
  static void showRepeatedNotification() async {
    NotificationDetails details = const NotificationDetails(
        android: AndroidNotificationDetails("Id_1", "Repeated Notification",
            importance: Importance.max, priority: Priority.high));
    await flutterLocalNotificationsPlugin.periodicallyShow(
        1, "Repeated Notification", "body", RepeatInterval.weekly, details);
  }

//Schduled Notification
  static void showSchduledNotification(int id ,int hour,int min) async {
    NotificationDetails details = const NotificationDetails(
        android: AndroidNotificationDetails("Id_2", "Schduled Notification",
            importance: Importance.max, priority: Priority.high));
    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      "Schduled Notification",
      "body",
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      //tz.TZDateTime.now(tz.local).add(Duration(seconds: 10)),
      tz.TZDateTime(tz.local, 2024, 11, 8, hour, min),
      details,
    );
  }

  static void cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  static void cancelAllNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
