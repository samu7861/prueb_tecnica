import 'package:flutter/material.dart';

class AppTheme {
  static const Color _lightPrimaryColor = Color(0xFF2d4c65);
  static const Color _darkPrimaryColor = Color(0xFF4f87b2);

  ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: _lightPrimaryColor,
          brightness: Brightness.light,
        ),
        brightness: Brightness.light,
      );

  ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: _darkPrimaryColor,
          brightness: Brightness.dark,
        ),
        brightness: Brightness.dark,
      );
}
