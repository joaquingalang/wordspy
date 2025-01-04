import 'package:flutter/material.dart';
import 'package:wordspy/utils/constants.dart';
import 'package:wordspy/widgets/instructions.dart';
import 'package:wordspy/widgets/solver.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _imageScanned = false;

  List<List<String>> puzzleGrid = [
    ['I', 'J', 'W', 'I', 'D', 'G', 'E', 'T', 'Q', 'P', 'M', 'V'],
    ['Y', 'D', 'Y', 'P', 'B', 'C', 'Q', 'F', 'Z', 'O', 'R', 'O'],
    ['G', 'H', 'P', 'T', 'R', 'E', 'E', 'T', 'S', 'M', 'N', 'R'],
    ['F', 'A', 'O', 'E', 'F', 'L', 'U', 'T', 'T', 'E', 'R', 'I'],
    ['D', 'A', 'R', 'T', 'I', 'B', 'V', 'U', 'Y', 'V', 'W', 'Y'],
    ['B', 'X', 'I', 'R', 'X', 'L', 'A', 'Y', 'O', 'U', 'T', 'I'],
    ['U', 'Y', 'E', 'E', 'X', 'X', 'X', 'O', 'S', 'B', 'P', 'L'],
    ['I', 'A', 'H', 'L', 'N', 'A', 'B', 'Q', 'T', 'H', 'Z', 'K'],
    ['L', 'F', 'Y', 'O', 'J', 'A', 'Z', 'F', 'A', 'T', 'Q', 'V'],
    ['D', 'F', 'E', 'A', 'F', 'Y', 'B', 'I', 'T', 'V', 'X', 'W'],
    ['B', 'B', 'U', 'D', 'Z', 'H', 'K', 'G', 'E', 'R', 'C', 'D'],
    ['J', 'J', 'B', 'Z', 'Z', 'T', 'H', 'R', 'C', 'Z', 'O', 'S'],
  ];

  List<String> wordList = [
    'FLUTTER',
    'DART',
    'WIDGET',
    'STATE',
    'BUILD',
    'TREE',
    'APP',
    'LAYOUT',
    'HOT',
    'RELOAD'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'WORDSPY',
          style: TextStyle(
            fontFamily: 'Axis',
            fontSize: 38,
            color: kDeepPurpleColor,
          ),
        ),
      ),
      body: SafeArea(
        child: (_imageScanned)
            ? Solver(
                puzzleGrid: puzzleGrid,
                wordList: wordList,
              )
            : InstructionBody(),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton.large(
          shape: CircleBorder(),
          backgroundColor: kOrangeColor,
          onPressed: () {
            setState(() {
              _imageScanned = !_imageScanned;
            });
          },
          child: Icon(
            (_imageScanned)
                ? Icons.add
                : Icons.add_a_photo_outlined,
            color: kDeepPurpleColor,
            size: 45,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
