import 'package:flutter/material.dart';

class CustomSnackBar {
  final BuildContext context;
  final String message;
  final Color backgroundColor;
  final Duration duration;
  final SnackBarAction? action;

  CustomSnackBar({
    required this.context,
    required this.message,
    this.backgroundColor = Colors.black87,
    this.duration = const Duration(seconds: 3),
    this.action,
  });

  void show() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: backgroundColor,
        duration: duration,
        action: action,
      ),
    );
  }
}
