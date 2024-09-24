import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:minimal_social_media_app/components/custom_list_tile.dart';
import 'package:minimal_social_media_app/helper/helper_functions.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("users").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              displayMessageToUser("something went wrong", context);
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.data == null) {
              return const Text("No data available");
            }

            final users = snapshot.data!.docs;

            return Column(
              children: [
                // const Padding(
                //   padding: EdgeInsets.only(top: 50.0, left: 25.0),
                //   child: Row(
                //     children: [
                //       CustomBackBtn(),
                //     ],
                //   ),
                // ),
                const SizedBox(height: 25),
                Expanded(
                  child: ListView.builder(
                    itemCount: users.length,
                    padding: const EdgeInsets.all(0),
                    itemBuilder: (context, index) {
                      final user = users[index];

                      String username = user['username'];
                      String email = user['email'];
                      return CustomListTile(title: username, subtitle: email);
                    },
                  ),
                )
              ],
            );
          }),
    );
  }
}
