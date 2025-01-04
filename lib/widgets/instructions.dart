import 'package:flutter/material.dart';

class InstructionBody extends StatelessWidget {
  const InstructionBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Scan A Word\nSearch Puzzle',
            style: TextStyle(
              fontFamily: 'Axis',
              fontSize: 32,
              color: Colors.black12,
            ),
            textAlign: TextAlign.center,
          ),
          Icon(
            Icons.arrow_downward,
            color: Colors.black12,
            size: 70,
          ),
        ],
      ),
    );
  }
}