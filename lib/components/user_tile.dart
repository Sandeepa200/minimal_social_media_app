import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String email;
  final String name;
  final void Function()? onTap;

  const UserTile({
    super.key,
    required this.name,
    required this.email,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            const Icon(Icons.person),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: Theme.of(context).textTheme.titleLarge),
                  Text(email, style: Theme.of(context).textTheme.titleSmall),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
