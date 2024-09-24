import 'package:flutter/material.dart';

class CustomAddPostBtn extends StatelessWidget {
  final void Function()? onTap;
  const CustomAddPostBtn({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(13),
        margin: const EdgeInsets.only(left: 10),
        child: Center(
          child: Icon(
            Icons.done,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ),
    );
  }
}
