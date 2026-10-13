import 'package:elevate_cycle6/config/di/di.dart';
import 'package:elevate_cycle6/config/firebase/notification_module.dart';
import 'package:elevate_cycle6/features/auth/presentation/view/login_view.dart';
import 'package:elevate_cycle6/features/home/firebase/products_seeder.dart';
import 'package:elevate_cycle6/flavors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  // Reads google-services.json / GoogleService-Info.plist (or pass
  // DefaultFirebaseOptions.currentPlatform if you use `flutterfire configure`).
  await Firebase.initializeApp();
  configureDependencies();
  await getIt.get<ProductsSeeder>().seed(); // demo data, remove after the session
  runApp(const MainApp());
  // Asks for permission and logs the FCM token.
  getIt.get<NotificationService>().init();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: Flavor.theme, home: const LoginView());
  }
}
