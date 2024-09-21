import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 0, 0, 0),
        brightness: Brightness.dark),
    scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
    useMaterial3: true,
  );
}
