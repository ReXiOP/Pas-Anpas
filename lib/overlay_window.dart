import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:sabak/widgets/%20overlay_widget.dart';


class OverlayWindowApp extends StatefulWidget {
  @override
  _OverlayWindowAppState createState() => _OverlayWindowAppState();

  static Future<void> showOverlay({
    required double height,
    required double width,
    required OverlayAlignment alignment,
    OverlayFlag? flag = OverlayFlag.defaultFlag,
  }) async {
    // Check and request permission only if needed
    if (await FlutterOverlayWindow.isPermissionGranted()) {
      // Convert height and width to integers
      int intHeight = height.toInt();
      int intWidth = width.toInt();

      // Set up the overlay
      await FlutterOverlayWindow.showOverlay(
        height: intHeight,
        width: intWidth,
        alignment: alignment,
        flag: flag!,
      );
    } else {
      // Handle the case when permission is not granted
      // For example, you could show a dialog to the user
    }
  }

  static void closeOverlay() async {
    await FlutterOverlayWindow.closeOverlay();
  }
}

class _OverlayWindowAppState extends State<OverlayWindowApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OverlayWidget(
        title: 'Reminder',
        body: 'পাছ আনপাছ হচ্ছে?',
      ),
    );
  }
}

