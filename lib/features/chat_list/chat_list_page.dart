import 'package:flutter/material.dart';
import 'package:messenger/features/components/user_with_avatar.dart';
import 'package:messenger/theme.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            forceElevated: true,
            elevation: 2,
            bottom: PreferredSize(
              preferredSize: const Size(double.infinity, 16),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: CustomColors.stroke,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const Icon(Icons.search, color: CustomColors.gray),
                            const SizedBox(width: 8),
                            Text(
                              'Поиск',
                              style: theme.textTheme.bodyLarge!.copyWith(
                                  color: CustomColors.gray,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 4)
                  ],
                ),
              ),
            ),
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
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList.separated(
              itemBuilder: (context, index) => Padding(
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
              separatorBuilder: (context, index) => const Divider(),
            ),
          )
        ],
      ),
    );
  }
}
