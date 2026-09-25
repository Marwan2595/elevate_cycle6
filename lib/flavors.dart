import 'package:elevate_cycle6/core/theme/men_theme.dart';
import 'package:elevate_cycle6/core/theme/women_theme.dart';
import 'package:flutter/material.dart';

enum AppFlavor {
  men,
  women,
}


class Flavor {
  static AppFlavor appFlavor = AppFlavor.men;



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