import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:messenger/features/components/input_widget.dart';
import 'package:messenger/models/chat_user.dart';
import 'package:messenger/repository/chat_repository.dart';
import 'package:messenger/theme.dart';

class ChatBottom extends StatefulWidget {
  const ChatBottom({
    super.key,
    required this.user,
    required this.scrollController,
  });
  final ChatUser user;
  final ScrollController scrollController;

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

    widget.scrollController.animateTo(
      widget.scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  onSendFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
    }
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
                  onTap: () {
                    Future.delayed(const Duration(milliseconds: 300))
                        .then((value) {
                      widget.scrollController.animateTo(
                        widget.scrollController.position.maxScrollExtent + 50,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    });
                  },
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
