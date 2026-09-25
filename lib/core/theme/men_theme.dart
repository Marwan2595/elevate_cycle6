import 'package:flutter/material.dart';

class MenTheme {
  MenTheme._();

  static const Color primary = Color(0xFF1E3A5F); // navy
  static const Color secondary = Color(0xFF2E86AB); // steel blue
  static const Color background = Color(0xFFF4F6F8);

  static final ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: primary,
    primary: primary,
    secondary: secondary,
    surface: background,
  );

  static final ThemeData theme = ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: background,
    appBarTheme: const AppBarTheme(
      backgroundColor: primary,
      foregroundColor: Colors.white,
      centerTitle: true,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: primary),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );
}
