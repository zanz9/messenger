import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:messenger/features/components/user_with_avatar.dart';
import 'package:messenger/models/chat_user.dart';
import 'package:messenger/theme.dart';

import 'components/chat_bottom.dart';
import 'components/chat_messages.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key, required this.user});
  final ChatUser user;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
          onPressed: () {
            context.pop();
          },
        ),
        title: UserWithAvatar(
          title: '${user.firstName} ${user.lastName}',
          subtitle: Text(
            'В сети',
            style: theme.textTheme.bodyMedium!.copyWith(
              color: CustomColors.darkGray,
            ),
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size(double.infinity, 16),
          child: Divider(),
        ),
      ),
      body: ChatMessages(user: user),
      bottomNavigationBar: ChatBottom(user: user),
    );
  }
}
