import 'package:flutter/material.dart';
import 'package:minimal_social_media_app/components/custom_add_post_btn.dart';
import 'package:minimal_social_media_app/components/custom_drawer.dart';
import 'package:minimal_social_media_app/components/custom_list_tile.dart';
import 'package:minimal_social_media_app/components/custom_txt_field.dart';
import 'package:minimal_social_media_app/database/firestore.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final FirestoreDatabase database = FirestoreDatabase();

  final TextEditingController newPostController = TextEditingController();

  //post the message
  void addPost() {
    if (newPostController.text.isNotEmpty) {
      String message = newPostController.text;
      database.addPost(message);
    }

    //clear the controller
    newPostController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("W A L L"),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: "Say Something...",
                    obscureText: false,
                    controller: newPostController,
                  ),
                ),
                CustomAddPostBtn(
                  onTap: addPost,
                ),
              ],
            ),
          ),

          //post
          StreamBuilder(
              stream: database.getPostsStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                //get all the posts
                final posts = snapshot.data!.docs;

                if (snapshot.data == null || posts.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(25),
                      child: Text("No Posts Available"),
                    ),
                  );
                }

                //return as a list
                return Expanded(
                  child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final post = posts[index];

                      //get data from each post
                      String message = post['PostMessage'];
                      String email = post['UserEmail'];
                      String timestamp = post['Timestamp'].toString();

                      return CustomListTile(
                        title: message,
                        subtitle: email,
                        //timestamp: timestamp,
                      );
                    },
                  ),
                );
              })
        ],
      ),
    );
  }
}
