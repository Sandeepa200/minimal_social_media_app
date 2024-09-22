import 'package:flutter/material.dart';
import 'package:minimal_social_media_app/components/custom_btn.dart';
import 'package:minimal_social_media_app/components/custom_txt_field.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              color: Theme.of(context).colorScheme.inversePrimary,
              size: 80,
            ),
            const SizedBox(height: 25),
            const Text(
              "M I N I M A L",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            CustomTextField(
              hintText: "Email",
              obscureText: false,
              controller: emailController,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              hintText: "Password",
              obscureText: true,
              controller: passwordController,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("forgot password?",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary)),
              ],
            ),
            const SizedBox(height: 25),
            CustomButton(
              text: "Login",
              onTap: () {},
            ),
          ],
        ),
      )),
    );
  }
}
