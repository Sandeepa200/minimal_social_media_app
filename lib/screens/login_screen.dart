import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimal_social_media_app/components/custom_btn.dart';
import 'package:minimal_social_media_app/components/custom_txt_field.dart';
import 'package:minimal_social_media_app/helper/helper_functions.dart';

class LoginScreen extends StatefulWidget {
  final void Function()? onTap;

  const LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void login() async {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        );
      },
    );

    if (emailController.text == "") {
      Navigator.pop(context);
      displayMessageToUser("Please Enter Your Email", context);
      return;
    }

    if (passwordController.text == "") {
      Navigator.pop(context);
      displayMessageToUser("Please Enter Your Password", context);
      return;
    }

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
      displayMessageToUser("Successfully Logged In", context);
      return;
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      // Handle specific Firebase login errors
      if (e.code == 'invalid-credential') {
        displayMessageToUser("invalid credential. Please try again.", context);
        return;
      } else if (e.code == 'user-not-found') {
        displayMessageToUser("No account found for this email.", context);
        return;
      } else if (e.code == 'invalid-email') {
        displayMessageToUser("The email address is not valid.", context);
        return;
      } else if (e.code == 'too-many-requests') {
        displayMessageToUser(
            "Too many login attempts. Try again later.", context);
        return;
      } else {
        // Generic error message for other cases
        displayMessageToUser("Login failed. Please try again.", context);
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
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
                        color: Theme.of(context).colorScheme.tertiary)),
              ],
            ),
            const SizedBox(height: 25),
            CustomButton(
              text: "Login",
              onTap: login,
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary)),
                TextButton(
                  onPressed: widget.onTap,
                  child: Text("Sign up Here",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
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
