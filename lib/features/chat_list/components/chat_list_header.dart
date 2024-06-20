import 'package:flutter/material.dart';
import 'package:messenger/features/components/input_widget.dart';
import 'package:messenger/theme.dart';

class ChatListHeader extends StatelessWidget {
  const ChatListHeader({
    super.key,
  });

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
              child: Text(
                'Чаты',
                style: theme.textTheme.titleLarge!
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 36),
              ),
            ),
          ),
        ),
      ),
      bottom: const PreferredSize(
        preferredSize: Size(double.infinity, 16),
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputWidget(
                text: 'Поиск',
                prefixIcon: Icon(Icons.search, color: CustomColors.gray),
              ),
              SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
}
