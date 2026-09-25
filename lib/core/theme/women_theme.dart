import 'package:flutter/material.dart';

class WomenTheme {
  WomenTheme._();

  static const Color primary = Color(0xFFC2185B); // rose
  static const Color secondary = Color(0xFFF48FB1); // soft pink
  static const Color background = Color(0xFFFFF5F8);

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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    ),
  );
}
