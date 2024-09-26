import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimal_social_media_app/components/custom_btn.dart';
import 'package:minimal_social_media_app/components/custom_txt_field.dart';
import 'package:minimal_social_media_app/helper/helper_functions.dart';
import 'package:minimal_social_media_app/services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  final void Function()? onTap;
  const RegisterScreen({super.key, required this.onTap});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final AuthService _authService = AuthService();

  void register() async {
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

    if (_usernameController.text == "" ||
        _emailController.text == "" ||
        _passwordController.text == "" ||
        _confirmPasswordController.text == "") {
      Navigator.pop(context);
      displayMessageToUser("Please fill in all the fields", context);
      return;
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
        .hasMatch(_emailController.text)) {
      Navigator.pop(context);
      displayMessageToUser("Please enter a valid email", context);
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      Navigator.pop(context);
      displayMessageToUser("Passwords don't match", context);
      return;
    }

    try {
      UserCredential? userCredential =
          await _authService.registerWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (userCredential != null && mounted) {
        Navigator.pop(context);
        await _authService.createUserDocument(
            userCredential, _usernameController.text);
        displayMessageToUser("Account created successfully", context);
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      String message;
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = 'Registration failed. Please try again later.';
      }
      displayMessageToUser(message, context);
    } catch (e) {
      if (mounted) {
        Navigator.pop(context); // Dismiss loading
        displayMessageToUser('An unexpected error occurred.', context);
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
        child: SingleChildScrollView(
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
                controller: _usernameController,
              ),
              const SizedBox(height: 10),
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
              CustomTextField(
                hintText: "Retype Password",
                obscureText: true,
                controller: _confirmPasswordController,
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
                text: "Register",
                onTap: register,
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary)),
                  TextButton(
                    onPressed: widget.onTap,
                    child: Text("Login Here",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
