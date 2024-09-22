import 'package:flutter/material.dart';
import 'package:minimal_social_media_app/components/custom_btn.dart';
import 'package:minimal_social_media_app/components/custom_txt_field.dart';

class RegisterScreen extends StatelessWidget {

  final void Function()? onTap;
  RegisterScreen({super.key, required this.onTap});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void register() {}
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
              hintText: "Username",
              obscureText: false,
              controller: usernameController,
            ),
            const SizedBox(height: 10),
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
            CustomTextField(
              hintText: "Retype Password",
              obscureText: true,
              controller: confirmPasswordController,
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
              text: "Register",
              onTap: register,
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary)),
                TextButton(
                  onPressed: onTap,
                  child: Text("Login Here",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
