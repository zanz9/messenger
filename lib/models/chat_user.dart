import 'package:cloud_firestore/cloud_firestore.dart';

class ChatUser {
  final String email;
  final String name;

  late String? chatId;
  late String? lastMessage;
  late String? lastMessageFrom;
  late Timestamp? lastMessageTime;

  ChatUser({
    required this.email,
    required this.name,
    this.chatId,
    this.lastMessage,
    this.lastMessageFrom,
    this.lastMessageTime,
  });
}
