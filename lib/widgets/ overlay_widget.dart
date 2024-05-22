import 'package:flutter/material.dart';
import '../overlay_window.dart';

class OverlayWidget extends StatelessWidget {
  final String title;
  final String body;

  const OverlayWidget({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: EdgeInsets.all(16), // Add margin around the container
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.lightBlue[100],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Stack( // Use Stack to position the close button
          children: [
            Padding(
              padding: EdgeInsets.only(right: 24), // Add padding for the close button
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, // Keep the column as small as possible
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    body,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  SizedBox(height: 16), // Add some space at the bottom
                ],
              ),
            ),
            Positioned( // Position close button at top right
              top: 0,
              right: 0,
              child: IconButton(
                icon: Icon(Icons.close, size: 18),
                onPressed: OverlayWindowApp.closeOverlay,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
