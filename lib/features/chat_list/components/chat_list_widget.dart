import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:messenger/features/components/user_with_avatar.dart';
import 'package:messenger/router.dart';
import 'package:messenger/theme.dart';

class ChatListWidget extends StatelessWidget {
  const ChatListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverList.separated(
        itemBuilder: (context, index) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            context.pushNamed(RouterNames.CHAT_PAGE);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserWithAvatar(
                  title: 'Виктор Власов',
                  subtitle: Row(
                    children: [
                      Text(
                        'Вы: ',
                        style: theme.textTheme.bodyMedium,
                      ),
                      Text(
                        'Привет!',
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: CustomColors.darkGray,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Вчера',
                  style: theme.textTheme.bodySmall!.copyWith(
                    color: CustomColors.darkGray,
                  ),
                )
              ],
            ),
          ),
        ),
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}
