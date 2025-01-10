import 'package:flutter/material.dart';
import 'package:wordspy/utils/constants.dart';

class StepIcon extends StatelessWidget {
  const StepIcon({
    super.key,
    required this.iconData,
    required this.text,
    required this.color,
  });

  final IconData iconData;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        spacing: 5,
        children: [
          Icon(iconData,
              color: color, size: 40),
          Text(text, style: kXSmallTextStyle),
        ],
      ),
    );
  }
}