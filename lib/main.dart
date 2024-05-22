import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'notification_manager.dart';
import 'overlay_window.dart';
import 'widgets/home_screen.dart';
import 'package:permission_handler/permission_handler.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationManager.initialize();

  // Check if it's the first run
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstRun = prefs.getBool('firstRun') ?? true;
  if (isFirstRun) {
    await Permission.systemAlertWindow.request(); // Request permission
    await prefs.setBool('firstRun', false); // Mark first run as done
  }

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'যিকির Notification',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: HomeScreen(),
    );
  }
}
