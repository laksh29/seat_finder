import 'package:flutter/material.dart';

ButtonStyle buttonStyle() {
  return ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ));
}
