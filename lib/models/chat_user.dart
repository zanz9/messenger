class ChatUser {
  final String email;
  final String name;

  late String? chatId;
  late String? lastMessage;
  late String? lastMessageFrom;
  late DateTime? lastMessageTime;

  ChatUser({
    required this.email,
    required this.name,
    this.chatId,
    this.lastMessage,
    this.lastMessageFrom,
    this.lastMessageTime,
  });
}
