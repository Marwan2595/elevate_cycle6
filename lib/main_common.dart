import 'package:elevate_cycle6/config/di/di.dart';
import 'package:elevate_cycle6/features/flavors/presentation/view/flavors_view.dart';
import 'package:elevate_cycle6/flavors.dart';
import 'package:flutter/material.dart';

void mainCommon() {
  configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: Flavor.theme, home: const FlavorsView());
  }
}
