import 'package:flutter/material.dart';
import 'package:wordspy/utils/constants.dart';
import 'package:wordspy/widgets/word_list_view.dart';

class Solver extends StatefulWidget {
  const Solver({
    super.key,
    required this.puzzleGrid,
    required this.wordList,
  });

  final List<List<String>> puzzleGrid;
  final List<String> wordList;

  @override
  State<Solver> createState() => _SolverState();
}

class _SolverState extends State<Solver> {
  late final int _gridDimensions;
  late final int _wordCount;
  late List<List<Color>> _colorGrid;
  late List _letterList;
  late List _colorList;

  List<List<Color>> buildColorGrid() {
    List<Color> row = [];
    for (int i = 0; i < _gridDimensions; i++) {
      row.add(kDarkBrownColor);
    }
    List<List<Color>> colorGrid = [];
    for (int i = 0; i < _gridDimensions; i++) {
      colorGrid.add(row);
    }
    return colorGrid;
  }

  List<Color> buildWordColorList() {
    List<Color> wordColorList = [];
    int colorIndex = 0;
    for (int i = 0; i < _wordCount; i++) {
      switch (colorIndex) {
        case 0:
          wordColorList.add(kTealColor);
          break;
        case 1:
          wordColorList.add(kRedColor);
          break;
        case 2:
          wordColorList.add(kYellowColor);
          break;
        case 3:
          wordColorList.add(kOrangeColor);
          break;
      }
      if (colorIndex > 3) colorIndex = 0;
    }
    return wordColorList;
  }

  List gridToList(List<List> grid) {
    List convertedList = [];
    for (int i = 0; i < grid.length; i++) {
      List row = grid[i];
      for (int j = 0; j < row.length; j++) {
        convertedList.add(row[j]);
      }
    }
    return convertedList;
  }

  void solveWordSearchPuzzle() {
    for (String word in widget.wordList) {
      int letterIndex = 0;
      for (int row = 0; row < _gridDimensions; row++) {
        for (int col = 0; col < _gridDimensions; col++) {
          if (widget.puzzleGrid[row][col] == word[letterIndex]) {
            print('${widget.puzzleGrid[row][col]} = ${word[letterIndex]}');
          }
        }
      }
    }
  }

  @override
  void initState() {
    _gridDimensions = widget.puzzleGrid.length;
    _wordCount = widget.wordList.length;
    _colorGrid = buildColorGrid();
    _letterList = gridToList(widget.puzzleGrid);
    _colorList = gridToList(_colorGrid);
    solveWordSearchPuzzle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          SizedBox(
            width: 400,
            height: 400,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _gridDimensions, // Number of items per row
                crossAxisSpacing: 5.0, // Horizontal spacing between items
                mainAxisSpacing: 5.0, // Vertical spacing between items
              ),
              itemBuilder: (context, index) {
                return Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: kDarkCreamColor,
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: Center(
                      child: Text(
                        _letterList[index],
                        style: TextStyle(color: _colorList[index]),
                      ),
                    ),
                  ),
                ); // Replace with your widget
              },
              itemCount: _letterList.length, // Total number of items
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kCreamColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      'MISSING WORDS',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 22,
                        color: kDeepPurpleColor,
                        letterSpacing: 5,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Divider(
                      height: 0,
                      thickness: 2,
                    ),
                    Expanded(
                      child: WordListView(words: widget.wordList),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}