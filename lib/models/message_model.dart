import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String message;
  final String senderEmail;
  final String recipientEmail;
  final Timestamp timestamp;

  MessageModel({
    required this.message,
    required this.senderEmail,
    required this.recipientEmail,
    required this.timestamp,
  });

  //convert the message model into a map
  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'senderEmail': senderEmail,
      'recipientEmail': recipientEmail,
      'timestamp': timestamp,
    };
  }
}