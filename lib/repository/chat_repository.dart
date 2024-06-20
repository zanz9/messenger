import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messenger/models/chat_user.dart';

class ChatRepository {
  static Future<List<ChatUser>> getAllUsers({String search = ""}) async {
    var db = FirebaseFirestore.instance;
    final usersRef = db.collection("users");
    final users = await usersRef
        .where('name', isGreaterThanOrEqualTo: search)
        .where('name', isLessThanOrEqualTo: '$search\uf8ff')
        .get();

    List<ChatUser> usersList = [];
    for (var user in users.docs) {
      if (user.id == FirebaseAuth.instance.currentUser!.email) continue;
      var data = user.data();
      var chatUser = ChatUser(
        email: user.id,
        name: data['name'],
      );
      usersList.add(chatUser);

      var a = await db
          .collection("chats")
          .where("users",
              arrayContains: FirebaseAuth.instance.currentUser!.email)
          .get();
      for (var element in a.docs) {
        var dataChat = element.data();
        if (dataChat['users'].contains(user.id)) {
          chatUser.chatId = element.id;
          if (dataChat['message'] != null) {
            chatUser.lastMessage = (dataChat['message'] as List).lastOrNull;
          }
        }
      }
    }
    return usersList;
  }

  static Future createNewChat(String email) async {
    var db = FirebaseFirestore.instance;
    var chat = <String, dynamic>{
      "users": [email, FirebaseAuth.instance.currentUser!.email]
    };
    await db.collection("chats").add(chat);
  }

  static Future sendMessage(String chatId, message) async {
    var db = FirebaseFirestore.instance;
    await db.collection("chats").doc(chatId).update({
      "messages": FieldValue.arrayUnion([
        {
          "message": message,
          "from": FirebaseAuth.instance.currentUser!.email,
          "time": Timestamp.now(),
        }
      ])
    });
  }
}
