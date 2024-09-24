import 'package:flutter/material.dart';
import 'package:minimal_social_media_app/components/custom_drawer.dart';
import 'package:minimal_social_media_app/components/custom_txt_field.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController newPostController = TextEditingController();

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
            child: CustomTextField(
              hintText: "Say Something...",
              obscureText: false,
              controller: newPostController,
            ),
          )
        ],
      ),
    );
  }
}
