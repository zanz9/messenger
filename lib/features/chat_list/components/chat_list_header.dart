import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger/features/components/input_widget.dart';
import 'package:messenger/theme.dart';

class ChatListHeader extends StatelessWidget {
  const ChatListHeader({
    super.key,
    required this.searchController,
  });
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return SliverAppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      forceElevated: true,
      elevation: 2,
      expandedHeight: 120,
      floating: false,
      pinned: true,
      snap: false,
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
            child: SizedBox(
              height: 80,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Чаты',
                    style: theme.textTheme.titleLarge!
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 36),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.logout,
                      color: CustomColors.darkGray,
                    ),
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 16),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputWidget(
                text: 'Поиск',
                prefixIcon: const Icon(Icons.search, color: CustomColors.gray),
                controller: searchController,
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
}
