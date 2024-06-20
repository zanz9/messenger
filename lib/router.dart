// ignore_for_file: constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:messenger/features/auth/login_page.dart';
import 'package:messenger/features/auth/register_page.dart';
import 'package:messenger/features/chat/chat_page.dart';
import 'package:messenger/features/chat_list/chat_list_page.dart';
import 'package:messenger/models/chat_user.dart';

class RouterNames {
  static const String CHAT_LIST_PAGE = 'CHAT_LIST_PAGE';
  static const String CHAT_PAGE = 'CHAT_PAGE';
  static const String LOGIN_PAGE = 'LOGIN_PAGE';
  static const String REGISTER_PAGE = 'REGISTER_PAGE';
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
        builder: (context, state) {
          ChatUser user = state.extra as ChatUser;
          return ChatPage(user: user);
        }),
    GoRoute(
      path: '/login',
      name: RouterNames.LOGIN_PAGE,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/register',
      name: RouterNames.REGISTER_PAGE,
      builder: (context, state) => const RegisterPage(),
    )
  ],
  redirect: (BuildContext context, GoRouterState state) async {
    final bool isNotLogin = FirebaseAuth.instance.currentUser == null;
    if ((isNotLogin && state.matchedLocation != '/login') &&
        (isNotLogin && state.matchedLocation != '/register')) {
      return '/register';
    }
    if (!isNotLogin && state.matchedLocation == '/login') {
      return '/';
    }
    if (!isNotLogin && state.matchedLocation == '/register') {
      return '/';
    }
    return null;
  },
);
