import 'package:flutter/material.dart';
import 'package:wordspy/utils/constants.dart';
import 'package:wordspy/widgets/solver_interface.dart';
import 'package:wordspy/widgets/add_word_sheet.dart';

class SolverScreen extends StatefulWidget {
  const SolverScreen({super.key, required this.puzzleGrid, required this.wordList});

  final List<List<String>> puzzleGrid;
  final List<String> wordList;

  @override
  State<SolverScreen> createState() => _SolverScreenState();
}

class _SolverScreenState extends State<SolverScreen> {
  // List<List<String>> puzzleGrid = [
  //   ['I', 'J', 'W', 'I', 'D', 'G', 'E', 'T', 'Q', 'P', 'M', 'V'],
  //   ['Y', 'D', 'Y', 'P', 'B', 'C', 'Q', 'F', 'Z', 'O', 'R', 'O'],
  //   ['G', 'H', 'P', 'T', 'R', 'E', 'E', 'T', 'S', 'M', 'N', 'R'],
  //   ['F', 'A', 'O', 'E', 'F', 'L', 'U', 'T', 'T', 'E', 'R', 'I'],
  //   ['D', 'A', 'R', 'T', 'I', 'B', 'V', 'U', 'Y', 'V', 'W', 'Y'],
  //   ['B', 'X', 'I', 'R', 'X', 'L', 'A', 'Y', 'O', 'U', 'T', 'I'],
  //   ['U', 'Y', 'E', 'E', 'X', 'X', 'X', 'O', 'S', 'B', 'P', 'L'],
  //   ['I', 'A', 'H', 'L', 'N', 'A', 'B', 'Q', 'T', 'H', 'Z', 'K'],
  //   ['L', 'F', 'Y', 'O', 'J', 'A', 'Z', 'F', 'A', 'T', 'Q', 'V'],
  //   ['D', 'F', 'E', 'A', 'F', 'Y', 'B', 'I', 'T', 'V', 'X', 'W'],
  //   ['B', 'B', 'U', 'D', 'Z', 'H', 'K', 'G', 'E', 'R', 'C', 'D'],
  //   ['J', 'J', 'B', 'Z', 'Z', 'T', 'H', 'R', 'C', 'Z', 'O', 'S'],
  // ];
  //
  // List<String> wordList = [
  //   'FLUTTER',
  //   'DART',
  //   'WIDGET',
  //   'STATE',
  //   'BUILD',
  //   'TREE',
  //   'APP',
  //   'LAYOUT',
  //   'HOT',
  //   'RELOAD'
  // ];

  void addNewWord(String word) {
    setState(() {
      widget.wordList.add(word);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: kDeepPurpleColor,
            size: 35,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'WORDSPY',
          style: TextStyle(
            fontFamily: 'Axis',
            fontSize: 38,
            color: kDeepPurpleColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SolverInterface(
          puzzleGrid: widget.puzzleGrid,
          wordList: widget.wordList,
        ),
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
            showModalBottomSheet(
              context: context,
              builder: (context) => AddWordSheet(
                onSubmit: addNewWord,
              ),
            );
          },
          child: Icon(
            Icons.add,
            color: kDeepPurpleColor,
            size: 45,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
