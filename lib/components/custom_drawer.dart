import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimal_social_media_app/helper/helper_functions.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  void logout(BuildContext context) async {
    // Show Yes/No confirmation dialog before logging out
    bool? result = await showYesNoDialog(
      context,
      title: 'Logout',
      content: 'Are you sure you want to log out?',
    );

    if (result == true) {
      // User pressed "Yes", proceed with logout
      FirebaseAuth.instance.signOut();
      displaySnackbarMessage(context, 'You have been logged out.');
    } else {
      // User pressed "No" or dismissed the dialog, do nothing
      displaySnackbarMessage(context, 'Logout canceled.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            const DrawerHeader(child: Icon(Icons.person)),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: const Icon(Icons.home),
                title: const Text("H O M E"),
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: const Icon(Icons.person),
                title: const Text("P R O F I L E"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/profile_screen");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: const Icon(Icons.group),
                title: const Text("U S E R S"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/users_screen");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: const Icon(Icons.group),
                title: const Text("W E A T H E R"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/weather_screen");
                },
              ),
            )
          ]),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("L O G O U T"),
              onTap: () => logout(context),
            ),
          ),
        ],
      ),
    );
  }
}
