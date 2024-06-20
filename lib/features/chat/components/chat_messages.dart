import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:messenger/models/chat_user.dart';
import 'package:messenger/theme.dart';

class ChatMessages extends StatefulWidget {
  const ChatMessages({super.key, required this.user});
  final ChatUser user;

  @override
  State<ChatMessages> createState() => _ChatMessagesState();
}

class _ChatMessagesState extends State<ChatMessages> {
  List<Message> messages = [];

  listenMessages() async {
    var db = FirebaseFirestore.instance;
    final docRef = db.collection("chats").doc(widget.user.chatId);
    docRef.snapshots().listen(
      (event) {
        if (event.data() != null) {
          var data = event.data();
          if (data!['messages'] != null) {
            messages = [];
            for (var element in data['messages']) {
              messages.add(Message(
                message: element['message'],
                from: element['from'],
                time: element['time'],
              ));
            }
            setState(() {});
          }
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    listenMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return Align(
            alignment:
                messages[index].from == FirebaseAuth.instance.currentUser!.email
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
            child: UnconstrainedBox(
              child: Container(
                decoration: BoxDecoration(
                  color: messages[index].from ==
                          FirebaseAuth.instance.currentUser!.email
                      ? CustomColors.green
                      : CustomColors.stroke,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20),
                    topRight: const Radius.circular(20),
                    bottomLeft: messages[index].from ==
                            FirebaseAuth.instance.currentUser!.email
                        ? const Radius.circular(20)
                        : const Radius.circular(0),
                    bottomRight: messages[index].from ==
                            FirebaseAuth.instance.currentUser!.email
                        ? const Radius.circular(0)
                        : const Radius.circular(20),
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                child: Row(
                  children: [
                    Text(messages[index].message),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Message {
  final String message;
  final String from;
  final Timestamp time;

  Message({required this.message, required this.from, required this.time});
}
