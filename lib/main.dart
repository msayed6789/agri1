import 'package:agri/firebase_options.dart';
import 'package:agri/pages/home.dart';
import 'package:agri/shared/notification.dart';
import 'package:agri/shared/work_manger.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:workmanager/workmanager.dart';

/*
Future main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationService1.init();
  runApp(const MyApp());
}
*/

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await LocalNotificationService1.init();

  await WorkManagerService().init();



  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: const Home(),
    );
  }
}
