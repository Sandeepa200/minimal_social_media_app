import 'package:flutter/material.dart';
import 'package:minimal_social_media_app/screens/login_screen.dart';
import 'package:minimal_social_media_app/screens/register_screen.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage) {
      return LoginScreen(onTap: toggleScreens);
    } else {
      return RegisterScreen(onTap: toggleScreens);
    }
  }
}
