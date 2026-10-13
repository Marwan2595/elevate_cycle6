import 'package:elevate_cycle6/config/di/di.dart';
import 'package:elevate_cycle6/features/celebration/presentation/view/celebration_view.dart';
import 'package:elevate_cycle6/flavors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: Flavor.theme, home: const CelebrationView());
  }
}
