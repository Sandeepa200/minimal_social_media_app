import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimal_social_media_app/components/user_tile.dart';
import 'package:minimal_social_media_app/screens/user_chat_screen.dart';
import 'package:minimal_social_media_app/services/auth_service.dart';
import 'package:minimal_social_media_app/services/chat_service.dart';

class ChatsScreen extends StatelessWidget {
  ChatsScreen({super.key});

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("C H A T S"),
      ),
      body: _buildChatsList(),
    );
  }

  //build a list of users except the current user
  Widget _buildChatsList() {
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildChatsListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  Widget _buildChatsListItem(
      Map<String, dynamic> userData, BuildContext context) {
    if (userData['email'] != _authService.getCurrentUser()!.email) {
      return UserTile(
        name: userData['username'],
        email: userData['email'],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserChatScreen(
                receiverEmail: userData['email'],
                receiverName: userData['username'],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
