import 'package:elevate_cycle6/core/theme/men_theme.dart';
import 'package:elevate_cycle6/core/theme/women_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

enum AppFlavor {
  men,
  women,
}


class Flavor {
  static AppFlavor appFlavor = AppFlavor.men;

  // Values come from the git-ignored `.env` file (loaded in mainCommon).
  static String get baseUrl => dotenv.env['BASE_URL']!;

  static String get googleMapsApiKey => dotenv.env['GOOGLE_MAPS_API_KEY']!;

  /// Allowed server certificate SHA-256 fingerprints (SSL pinning).
  static List<String> get sslPins => (dotenv.env['SSL_PINS'] ?? '')
      .split(',')
      .map((e) => e.trim())
      .where((e) => e.isNotEmpty)
      .toList();


  static String get productsCategoryID {
    switch (appFlavor) {
      case AppFlavor.men:
        return '6439d5b90049ad0b52b90048';
      case AppFlavor.women:
        return '6439d58a0049ad0b52b9003f';
    }
  }

  static String get appName {
    switch (appFlavor) {
      case AppFlavor.men:
        return 'Men\'s Flavors';
      case AppFlavor.women:
        return 'Women\'s Flavors';
    }
  }

  static ThemeData get theme {
    switch (appFlavor) {
      case AppFlavor.men:
        return MenTheme.theme;
      case AppFlavor.women:
        return WomenTheme.theme;
    }
  }
}