import 'package:flutter/material.dart';
import 'widgets/overlay_widget.dart';

class OverlayService {
  static OverlayEntry? _overlayEntry;

  static void showOverlay(BuildContext context, String title, String body) {
    _overlayEntry = OverlayEntry(
      builder: (context) => OverlayWidget(title: title, body: body),
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  static void removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
