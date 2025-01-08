import 'package:flutter/material.dart';
import 'package:wordspy/utils/constants.dart';

class ColorButton extends StatelessWidget {
  const ColorButton({
    super.key,
    this.color = kDeepPurpleColor,
    required this.title,
    required this.onPressed,
  });

  final Color color;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(title, style: kWhiteMediumTextStyle,),
        ),
      ),
    );
  }
}
