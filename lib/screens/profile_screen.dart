import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimal_social_media_app/components/custom_back_btn.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final User? currentUser = FirebaseAuth.instance.currentUser;

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    if (currentUser != null) {
      return await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.email)
          .get();
    } else {
      throw Exception("User not logged in");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Profile"),
      // ),
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: getUserDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Something went wrong!"),
            );
          } else if (snapshot.hasData) {
            if (snapshot.data!.exists) {
              Map<String, dynamic>? user = snapshot.data!.data();
              return Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 50.0, left: 25.0),
                      child: Row(
                        children: [
                          CustomBackBtn(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.all(25),
                      child: const Icon(Icons.person, size: 64),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      user?['username'] ?? 'No username available',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(user?['email'] ?? 'No email available',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        )),
                  ],
                ),
              );
            } else {
              return const Center(child: Text('User not found in Firestore.'));
            }
          } else {
            return const Text('No Data Available');
          }
        },
      ),
    );
  }
}
