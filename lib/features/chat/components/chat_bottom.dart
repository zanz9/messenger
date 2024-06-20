import 'package:flutter/material.dart';
import 'package:messenger/features/components/input_widget.dart';
import 'package:messenger/models/chat_user.dart';
import 'package:messenger/repository/chat_repository.dart';
import 'package:messenger/theme.dart';

class ChatBottom extends StatefulWidget {
  const ChatBottom({
    super.key,
    required this.user,
  });
  final ChatUser user;

  @override
  State<ChatBottom> createState() => _ChatBottomState();
}

class _ChatBottomState extends State<ChatBottom> {
  TextEditingController messageController = TextEditingController();
  bool isSendMessage = false;

  onSend() async {
    if (messageController.text.isEmpty) return;

    setState(() {
      isSendMessage = true;
    });
    await ChatRepository.sendMessage(
      widget.user.chatId!,
      messageController.text.trim(),
    );
    messageController.text = '';
    setState(() {
      isSendMessage = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          height: 80,
          margin: const EdgeInsets.only(bottom: 24, top: 12),
          padding: const EdgeInsets.only(left: 20, right: 20),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: CustomColors.stroke,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: const RotationTransition(
                    turns: AlwaysStoppedAnimation(45 / 360),
                    child: Icon(Icons.attach_file),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: InputWidget(
                  text: 'Сообщение',
                  controller: messageController,
                  isMultipleLines: true,
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: onSend,
                child: Container(
                  decoration: BoxDecoration(
                    color: CustomColors.stroke,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Icon(
                    Icons.send,
                    color: isSendMessage ? Colors.green : Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
