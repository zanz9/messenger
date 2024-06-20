import 'package:flutter/material.dart';
import 'package:messenger/features/components/user_with_avatar.dart';
import 'package:messenger/theme.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

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
            onPressed: () {},
          ),
          title: UserWithAvatar(
            title: 'Виктор Власов',
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
          )),
      body: const Center(
        child: Text('Чат'),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            height: 80,
            margin: const EdgeInsets.only(bottom: 24, top: 12),
            padding: const EdgeInsets.only(left: 20, right: 20),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: CustomColors.stroke,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: const RotationTransition(
                      turns: AlwaysStoppedAnimation(45 / 360),
                      child: Icon(Icons.attach_file),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: CustomColors.stroke,
                    ),
                    child: const TextField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        hintText: 'Сообщение',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: CustomColors.stroke,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: const Icon(Icons.send),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
