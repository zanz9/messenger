import 'package:flutter/material.dart';

import 'components/chat_list_header.dart';
import 'components/chat_list_widget.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          ChatListHeader(searchController: searchController),
          ChatListWidget(searchController: searchController),
        ],
      ),
    );
  }
}
