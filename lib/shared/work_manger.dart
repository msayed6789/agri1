import 'package:agri/shared/notification.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:workmanager/workmanager.dart';
// steps
//1.init work manager
//2.excute our task.
//3.register our task in work manager



class WorkManagerService {
  static registerMyTask(String taskID, String taskName, Duration time) async {
    //register my task
    await Workmanager().registerOneOffTask(taskID, taskName,
        //frequency: const Duration(minutes: 15),
        initialDelay: time);
  }

  //init work manager service
  Future<void> init() async {
    await Workmanager().initialize(actionTask, isInDebugMode: false);
    //registerMyTask();
  }

  void cancelTask(String id) {
    Workmanager().cancelAll();
  }
}

@pragma('vm-entry-point')
void actionTask() {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
     // initial notifications
  var initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
  //var initializationSettingsIOS = IOSInitializationSettings();

  var initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  //  iOS: initializationSettingsIOS,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  WidgetsFlutterBinding.ensureInitialized();

  flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );
  
  print("GG");
  //show notification
  Workmanager().executeTask((taskName, inputData) {
    LocalNotificationService1.showBasicNotification(
        "Take The Weight", "Take The Weight");
    return Future.value(true);
  });
}



//1.schedule notification at 9 pm.
//2.execute for this notification.
