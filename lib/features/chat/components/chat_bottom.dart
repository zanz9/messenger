import 'package:flutter/material.dart';
import 'package:messenger/features/components/input_widget.dart';
import 'package:messenger/theme.dart';

class ChatBottom extends StatelessWidget {
  const ChatBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              const Expanded(
                child: InputWidget(
                  text: 'Сообщение',
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
    );
  }
}
