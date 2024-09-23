import 'package:flutter/material.dart';
import 'package:minimal_social_media_app/components/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        
      ),
      drawer: CustomDrawer(),
    );
  }
}
