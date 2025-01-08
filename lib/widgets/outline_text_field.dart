import 'package:flutter/material.dart';
import 'package:wordspy/utils/constants.dart';

class OutlineTextField extends StatelessWidget {
  const OutlineTextField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(
        fontFamily: 'Axis',
        fontSize: 20,
      ),
      cursorColor: kDarkCreamColor,
      cursorHeight: 30,
      cursorWidth: 3,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 5,
              color: kDeepPurpleColor,
            ),
            borderRadius: BorderRadius.circular(10,)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 5,
              color: kDeepPurpleColor,
            ),
            borderRadius: BorderRadius.circular(10,)
        ),
      ),
    );
  }
}