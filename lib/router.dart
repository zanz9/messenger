// ignore_for_file: constant_identifier_names

import 'package:go_router/go_router.dart';
import 'package:messenger/features/chat/chat_page.dart';
import 'package:messenger/features/chat_list/chat_list_page.dart';

class RouterNames {
  static const String CHAT_LIST_PAGE = 'CHAT_LIST_PAGE';
  static const String CHAT_PAGE = 'CHAT_PAGE';
}

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: RouterNames.CHAT_LIST_PAGE,
      builder: (context, state) => const ChatListPage(),
    ),
    GoRoute(
      path: '/chat',
      name: RouterNames.CHAT_PAGE,
      builder: (context, state) => const ChatPage(),
    )
  ],
);
