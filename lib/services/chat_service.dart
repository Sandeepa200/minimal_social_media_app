import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:minimal_social_media_app/models/message_model.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //get user stream

  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection('users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        //go through each user
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  //send message

  Future<void> sendMessage(String recipientId, message) async {
    final String currentUserEmail = _firebaseAuth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    MessageModel newMessage = MessageModel(
      message: message,
      senderEmail: currentUserEmail,
      recipientEmail: recipientId,
      timestamp: timestamp,
    );

    //construct chat rooms
    List<String> ids = [currentUserEmail, recipientId];
    ids.sort();
    String chatRoomId = ids.join('-');

    //add message to chat room
    await _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  //get chat room stream
  Stream<QuerySnapshot> getMessages(String userId, otherUserId) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join('-');

    return _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }
}
