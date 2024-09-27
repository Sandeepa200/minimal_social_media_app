import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:minimal_social_media_app/components/chat_bubble.dart';
import 'package:minimal_social_media_app/services/auth_service.dart';
import 'package:minimal_social_media_app/services/chat_service.dart';

class UserChatScreen extends StatelessWidget {
  final String receiverEmail;
  final String receiverName;

  UserChatScreen({
    super.key,
    required this.receiverEmail,
    required this.receiverName,
  });

  final TextEditingController _messageController = TextEditingController();

  final AuthService _authService = AuthService();
  final ChatService _chatService = ChatService();

  //send message
  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(receiverEmail, _messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverName),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child: _buildMessagesList()),
          _buildUserInput(),
        ],
      ),
    );
  }

  Widget _buildMessagesList() {
    String senderEmail = _authService.getCurrentUser()!.email!;
    return StreamBuilder(
      stream: _chatService.getMessages(senderEmail, receiverEmail),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView(
          children: snapshot.data!.docs
              .map((doc) => _buildMessagesItem(doc))
              .toList(),
        );
      },
    );
  }

  Widget _buildMessagesItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    bool isCurrentUser =
        data['senderEmail'] == _authService.getCurrentUser()!.email;

    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment:
            isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          ChatBubble(
            message: data['message'],
            isCurrentUser: isCurrentUser,
          )
        ],
      ),
    );
  }

  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0, left: 20.0),
      child: Row(children: [
        Expanded(
          child: TextField(
            controller: _messageController,
            decoration: const InputDecoration(
              hintText: "Type a message...",
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.send),
          onPressed: sendMessage,
        ),
      ]),
    );
  }
}
