import 'package:flutter/material.dart';

class UserWithAvatar extends StatelessWidget {
  const UserWithAvatar({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final Widget subtitle;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      children: [
        const CircleAvatar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.green,
          radius: 25,
          child: Text('ВВ', style: TextStyle(fontSize: 20)),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle
          ],
        ),
      ],
    );
  }
}
