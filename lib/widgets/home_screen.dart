import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import '../notification_manager.dart';
import '../overlay_window.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedInterval = 1; // Default interval (minutes)
  bool _isOverlayEnabled = false;
  Timer? _timer;
  List<DropdownMenuItem<int>> get dropdownItems {
    List<DropdownMenuItem<int>> menuItems = [
      DropdownMenuItem(child: Text("1 minutes"), value: 1),
      DropdownMenuItem(child: Text("5 minutes"), value: 5),
      DropdownMenuItem(child: Text("10 minutes"), value: 10),
      DropdownMenuItem(child: Text("15 minutes"), value: 15),
      DropdownMenuItem(child: Text("30 minutes"), value: 30),
      DropdownMenuItem(child: Text("60 minutes"), value: 60)
    ];
    return menuItems;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _scheduleNotifications() {
    _timer = Timer.periodic(Duration(minutes: _selectedInterval), (_) async {
      NotificationManager.showNotification(
        'Reminder',
        'পাছ আনপাছ হচ্ছে??',
      );

      if (_isOverlayEnabled) {
        if (Platform.isAndroid) {
          var status = await Permission.systemAlertWindow.status;
          if (!status.isGranted) {
            await Permission.systemAlertWindow.request();
          }
        }

        OverlayWindowApp.showOverlay(
          height: 100.0,
          width: 200.0,
          alignment: OverlayAlignment.topCenter,
        );

        Future.delayed(Duration(seconds: 25), () {
          OverlayWindowApp.closeOverlay();
        });
      }
    });
  }

  void _cancelNotifications() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("পাছ আনপাছ যিকির App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<int>(
              value: _selectedInterval,
              items: dropdownItems,
              onChanged: (value) {
                setState(() {
                  _selectedInterval = value!;
                });
              },
            ),
            SwitchListTile(
              title: Text("Enable Overlay"),
              value: _isOverlayEnabled,
              onChanged: (value) {
                setState(() {
                  _isOverlayEnabled = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: _scheduleNotifications,
              child: Text("Start"),
            ),
            ElevatedButton(
              onPressed: _cancelNotifications,
              child: Text("Stop"),
            ),
          ],
        ),
      ),
    );
  }
}
