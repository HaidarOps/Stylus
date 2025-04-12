import 'package:flutter/material.dart';

extension ShowSnackBar on BuildContext {
  void showSnackBar(String s, {
    required String message,
    bool isError = false,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}