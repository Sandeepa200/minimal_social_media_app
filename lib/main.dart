import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minimal_social_media_app/auth/auth.dart';
import 'package:minimal_social_media_app/auth/login_or_register.dart';
import 'package:minimal_social_media_app/firebase_options.dart';
import 'package:minimal_social_media_app/screens/home_screen.dart';
import 'package:minimal_social_media_app/screens/profile_screen.dart';
import 'package:minimal_social_media_app/screens/users_screen.dart';
import 'package:minimal_social_media_app/theme/dark_mode.dart';
import 'package:minimal_social_media_app/theme/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      theme: lightMode,
      darkTheme: darkMode,
      routes: {
        '/login_or_register': (context) => const LoginOrRegister(),
        '/home_screen': (context) => const HomeScreen(),
        '/profile_screen': (context) => ProfileScreen(),
        '/users_screen': (context) => const UsersScreen(),
      },
    );
  }
}
