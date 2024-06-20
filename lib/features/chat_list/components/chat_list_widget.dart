import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:messenger/features/components/user_with_avatar.dart';
import 'package:messenger/models/chat_user.dart';
import 'package:messenger/repository/chat_repository.dart';
import 'package:messenger/router.dart';
import 'package:messenger/theme.dart';

class ChatListWidget extends StatefulWidget {
  const ChatListWidget({
    super.key,
    required this.searchController,
  });
  final TextEditingController searchController;

  @override
  State<ChatListWidget> createState() => _ChatListWidgetState();
}

class _ChatListWidgetState extends State<ChatListWidget> {
  bool isLoaded = false;
  List<ChatUser> users = [];

  @override
  void initState() {
    super.initState();
    ChatRepository.getAllUsers().then(
      (value) => setState(() {
        users = value;
        isLoaded = true;
      }),
    );

    widget.searchController.addListener(() async {
      users = await ChatRepository.getAllUsers(
          search: widget.searchController.text);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverList.separated(
        itemCount: users.length,
        itemBuilder: (context, index) {
          var user = users[index];
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              if (user.chatId == null) {
                ChatRepository.createNewChat(user.email).then((value) {
                  context.pushNamed(RouterNames.CHAT_PAGE, extra: user);
                });
              } else {
                context.pushNamed(RouterNames.CHAT_PAGE, extra: user);
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserWithAvatar(
                    title: user.name,
                    subtitle: Row(
                      children: user.lastMessage == null
                          ? []
                          : [
                              user.lastMessageFrom ==
                                      FirebaseAuth.instance.currentUser!.email
                                  ? Text(
                                      'Вы: ',
                                      style: theme.textTheme.bodyMedium,
                                    )
                                  : const SizedBox(),
                              Text(
                                '${user.lastMessage!.length > 35 ? '${user.lastMessage!.substring(0, 35)}...' : user.lastMessage}',
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  color: CustomColors.darkGray,
                                ),
                              ),
                            ],
                    ),
                  ),
                  Text(
                    user.lastMessageTime == null
                        ? ''
                        : user.lastMessageTime!
                            .toDate()
                            .toString()
                            .substring(11, 16),
                    style: theme.textTheme.bodySmall!.copyWith(
                      color: CustomColors.darkGray,
                    ),
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}
