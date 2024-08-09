import 'package:flutter/material.dart';

class AppTheme {
  static const Color _lightPrimaryColor = Color(0xFF4f87b2);
  static const Color _darkPrimaryColor = Color(0xFF2d4c65);
  static const Color _lightSecondaryColor = Color(0xFF05070a);
  static const Color _darkSecondaryColor = Color(0xFF242f3d);

  ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: _lightPrimaryColor,
          secondary: _lightSecondaryColor,
          brightness: Brightness.light,
        ),
        brightness: Brightness.light,
      );

  ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: _darkPrimaryColor,
          secondary: _darkSecondaryColor,
          brightness: Brightness.dark,
        ),
        brightness: Brightness.dark,
      );
}