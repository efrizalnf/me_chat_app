import 'package:flutter/material.dart';

Offstage menu(VoidCallback value, bool clicked) {
  return Offstage(
    offstage: clicked,
    child: AnimatedContainer(
      duration: const Duration(seconds: 2),
      width: 200,
      height: 300,
      curve: Curves.fastEaseInToSlowEaseOut,
      child: Column(
        children: [
          TextButton(
            onPressed: value,
            child: const Text(
              "Log out",
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
