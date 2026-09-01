import 'package:elevate_cycle6/config/di/di.dart';
import 'package:elevate_cycle6/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: LoginScreen());
  }
}
