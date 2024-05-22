import 'package:flutter/material.dart';

class OverlayWidget extends StatelessWidget {
  final String title; // Notification title
  final String body; // Notification body

  OverlayWidget({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50, // Adjust position as needed
      right: 20,
      child: Material(
        color: Colors.transparent, // Transparent background
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(body),
            ],
          ),
        ),
      ),
    );
  }
}
