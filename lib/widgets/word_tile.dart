import 'package:flutter/material.dart';
import 'package:wordspy/utils/constants.dart';

class WordTile extends StatelessWidget {
  const WordTile({
    super.key,
    required this.word,
    required this.color,
    required this.onLongPress,
  });

  final Color color;
  final String word;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onLongPress: onLongPress,
          child: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(90),
            ),
            child: Center(
              child: Text(
                word,
                style: TextStyle(
                  fontFamily: 'Axis',
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}