import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimal_social_media_app/components/custom_btn.dart';
import 'package:minimal_social_media_app/components/custom_txt_field.dart';
import 'package:minimal_social_media_app/helper/helper_functions.dart';
import 'package:minimal_social_media_app/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  final void Function()? onTap;

  const LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthService _authService = AuthService();

  void login(BuildContext context) async {
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

    if (_emailController.text == "") {
      Navigator.pop(context);
      displayMessageToUser("Please Enter Your Email", context);
      return;
    }

    if (_passwordController.text == "") {
      Navigator.pop(context);
      displayMessageToUser("Please Enter Your Password", context);
      return;
    }

    try {
      UserCredential? userCredential =
          await _authService.loginWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Successful login
      if (userCredential != null && mounted) {
        Navigator.pop(context); // Dismiss loading
        displayMessageToUser("Successfully Logged In", context);
      }
    } on FirebaseAuthException catch (e) {
      if (mounted) Navigator.pop(context); // Dismiss loading

      // Handle specific Firebase login errors
      String message;
      switch (e.code) {
        case 'invalid-credential':
          message = "Invalid credential. Please try again.";
          break;
        case 'user-not-found':
          message = "No account found for this email.";
          break;
        case 'invalid-email':
          message = "The email address is not valid.";
          break;
        case 'too-many-requests':
          message = "Too many login attempts. Try again later.";
          break;
        default:
          message = "Login failed. Please try again.";
      }
      displayMessageToUser(message, context);
    } catch (e) {
      if (mounted) Navigator.pop(context); // Dismiss loading
      displayMessageToUser("Login failed. Please try again.", context);
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
              controller: _emailController,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              hintText: "Password",
              obscureText: true,
              controller: _passwordController,
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
              onTap: () => login(context),
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
