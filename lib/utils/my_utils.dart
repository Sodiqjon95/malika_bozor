import 'package:flutter/material.dart';

class MyUtils {
// Second way of snack bar without any key!!!
  static showSnackBar(BuildContext context, String? text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text ?? ""),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
