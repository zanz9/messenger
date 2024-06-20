import 'package:flutter/material.dart';
import 'package:messenger/theme.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({
    super.key,
    required this.text,
    this.prefixIcon,
    this.isMultipleLines = false,
  });

  final String text;
  final Widget? prefixIcon;
  final bool isMultipleLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: CustomColors.stroke,
      ),
      child: TextField(
        maxLines: isMultipleLines ? null : 1,
        keyboardType: isMultipleLines ? TextInputType.multiline : null,
        decoration: InputDecoration(
          contentPadding: prefixIcon == null
              ? const EdgeInsets.symmetric(horizontal: 12)
              : null,
          hintText: text,
          border: InputBorder.none,
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}
