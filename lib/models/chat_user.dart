class ChatUser {
  final String email;
  final String firstName;
  final String lastName;

  late String? chatId;
  late String? lastMessage;
  late String? lastMessageFrom;
  late DateTime? lastMessageTime;

  ChatUser({
    required this.email,
    required this.firstName,
    required this.lastName,
    this.chatId,
    this.lastMessage,
    this.lastMessageFrom,
    this.lastMessageTime,
  });
}
