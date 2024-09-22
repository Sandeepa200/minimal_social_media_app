import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(12),
        )),
        hintText: hintText,
        filled: true,
        fillColor: Theme.of(context).colorScheme.background,
        contentPadding: const EdgeInsets.all(8),
      ),
      obscureText: obscureText,
    );
  }
}
