import 'package:flutter/material.dart';
import 'package:messenger/features/chat/chat_page.dart';
import 'package:messenger/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messenger',
      theme: ThemeData(
        useMaterial3: true,
        dividerColor: CustomColors.stroke,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const ChatPage(),
    );
  }
}
