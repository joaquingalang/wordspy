import 'package:flutter/material.dart';
import 'package:wordspy/utils/constants.dart';
import 'package:wordspy/widgets/word_list_view.dart';

class SolverInterface extends StatefulWidget {
  const SolverInterface({
    super.key,
    required this.puzzleGrid,
    required this.wordList,
  });

  final List<List<String>> puzzleGrid;
  final List<String> wordList;

  @override
  State<SolverInterface> createState() => _SolverInterfaceState();
}

class _SolverInterfaceState extends State<SolverInterface> {
  late final int _gridDimensions;
  late final int _wordCount;
  late List<List<Color>> _colorGrid;
  late List _letterList;
  late List _colorList;

  List<List<Color>> buildColorGrid() {
    List<List<Color>> colorGrid = [];
    for (int i = 0; i < _gridDimensions; i++) {
      List<Color> row = [];
      for (int i = 0; i < _gridDimensions; i++) {
        row.add(kDarkCreamColor);
      }
      colorGrid.add(row);
    }
    return colorGrid;
  }

  Color getColorByIndex(int colorIndex) {
    switch (colorIndex) {
      case 0:
        return kTealColor;
      case 1:
        return kRedColor;
      case 2:
        return kYellowColor;
      case 3:
        return kOrangeColor;
      case 4:
        return kPurpleColor;
    }
    return Colors.transparent;
  }

  List<Color> buildWordColorList() {
    List<Color> wordColorList = [];
    int colorIndex = 0;
    for (int i = 0; i < _wordCount; i++) {
      Color color = getColorByIndex(colorIndex);
      wordColorList.add(color);
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

  List<Direction> getValidDirections(String word, List<int> position) {
    int wordIndexLength = word.length - 1;
    int row = position[0];
    int col = position[1];
    int borderIndex = _gridDimensions - 1;
    bool top = (row - wordIndexLength < 0) ? false : true;
    bool left = (col - wordIndexLength < 0) ? false : true;
    bool bottom = (row + wordIndexLength > borderIndex) ? false : true;
    bool right = (col + wordIndexLength > borderIndex) ? false : true;

    List<Direction> validDrections = [];

    if (top) {
      validDrections.add(Direction.top);
    }
    if (left) {
      validDrections.add(Direction.left);
    }
    if (right) {
      validDrections.add(Direction.right);
    }
    if (bottom) {
      validDrections.add(Direction.bottom);
    }
    if (top && left) {
      validDrections.add(Direction.topLeft);
    }
    if (top && right) {
      validDrections.add(Direction.topRight);
    }
    if (bottom && left) {
      validDrections.add(Direction.bottomLeft);
    }
    if (bottom && right) {
      validDrections.add(Direction.bottomRight);
    }

    return validDrections;
  }

  List<List<int>> checkWordMatch(String word, List<int> position, Direction direction) {
    int wordIndexLength = word.length - 1;
    int startRow = position[0];
    int startCol = position[1];
    List<List<int>> indexList = [];
    int wordIndex;

    if (direction == Direction.top) {
      indexList = [];
      wordIndex = 0;
      for (int row = startRow; row >= 0; row--) {
        if (widget.puzzleGrid[row][startCol] == word[wordIndex]) {
          indexList.add([row, startCol]);

          if (wordIndex == wordIndexLength) {
            return indexList;
          }
          wordIndex++;
        } else {
          break;
        }
      }
    }

    if (direction == Direction.bottom) {
      indexList = [];
      wordIndex = 0;
      for (int row = startRow; row < _gridDimensions; row++) {
        if (widget.puzzleGrid[row][startCol] == word[wordIndex]) {
          indexList.add([row, startCol]);

          if (wordIndex == wordIndexLength) {
            return indexList;
          }

          wordIndex++;
        } else {
          break;
        }
      }
    }

    if (direction == Direction.left) {
      indexList = [];
      wordIndex = 0;
      for (int col = startCol; col >= 0; col--) {
        if (widget.puzzleGrid[startRow][col] == word[wordIndex]) {
          indexList.add([startRow, col]);

          if (wordIndex == wordIndexLength) {
            return indexList;
          }

          wordIndex++;
        } else {
          break;
        }
      }
    }

    if (direction == Direction.right) {
      indexList = [];
      wordIndex = 0;
      for (int col = startCol; col < _gridDimensions; col++) {
        if (widget.puzzleGrid[startRow][col] == word[wordIndex]) {
          indexList.add([startRow, col]);

          if (wordIndex == wordIndexLength) {
            return indexList;
          }

          wordIndex++;
        } else {
          break;
        }
      }
    }

    if (direction == Direction.topLeft) {
      indexList = [];
      wordIndex = 0;
      for (int row = startRow; row >= 0; row--) {
        int col = startCol-wordIndex;
        if (col < 0 || col >= _gridDimensions) break;
        if (widget.puzzleGrid[row][col] == word[wordIndex]) {
          indexList.add([row, col]);

          if (wordIndex == wordIndexLength) {
            return indexList;
          }

          wordIndex++;
        } else {
          break;
        }
      }
    }

    if (direction == Direction.topRight) {
      indexList = [];
      wordIndex = 0;
      for (int row = startRow; row >= 0; row--) {
        int col = startCol+wordIndex;
        if (col < 0 || col >= _gridDimensions) break;
        if (widget.puzzleGrid[row][col] == word[wordIndex]) {
          indexList.add([row, col]);

          if (wordIndex == wordIndexLength) {
            return indexList;
          }

          wordIndex++;
        } else {
          break;
        }
      }
    }

    if (direction == Direction.bottomLeft) {
      indexList = [];
      wordIndex = 0;
      for (int row = startRow; row < _gridDimensions; row++) {
        int col = startCol-wordIndex;
        if (col < 0 || col >= _gridDimensions) break;
        if (widget.puzzleGrid[row][col] == word[wordIndex]) {
          indexList.add([row, col]);

          if (wordIndex == wordIndexLength) {
            return indexList;
          }

          wordIndex++;
        } else {
          break;
        }
      }
    }

    if (direction == Direction.bottomRight) {
      indexList = [];
      wordIndex = 0;
      for (int row = startRow; row < _gridDimensions; row++) {
        int col = startCol+wordIndex;
        if (col < 0 || col >= _gridDimensions) break;
        if (widget.puzzleGrid[row][col] == word[wordIndex]) {
          indexList.add([row, col]);

          if (wordIndex == wordIndexLength) {
            return indexList;
          }

          wordIndex++;
        } else {
          break;
        }
      }
    }

    return indexList;
  }

  void solveWordSearchPuzzle() {
    int colorIndex = 0;
    for (String word in widget.wordList) {
      for (int row = 0; row < _gridDimensions; row++) {
        for (int col = 0; col < _gridDimensions; col++) {
          if (widget.puzzleGrid[row][col] == word[0]) {
            // TODO: Determine the match's position in the grid (edge, corner, standard)
            // TODO: Using enums, create a list of all valid directions to check (account for word length and grid dimensions)
            List<Direction> validDirections =
                getValidDirections(word, [row, col]);

            // TODO: Iterate through the list of all valid directions and execute the checkWordMatch function that accepts the paramters: word, x & y index, and direction to check
            for (Direction direction in validDirections) {
              List<List<int>> matchIndices =
                  checkWordMatch(word, [row, col], direction);

              if (matchIndices.length == word.length) {
                for (List<int> position in matchIndices) {
                  int row = position[0];
                  int col = position[1];
                  _colorGrid[row][col] = getColorByIndex(colorIndex);
                }
                setState(() {
                  _colorList = gridToList(_colorGrid);
                });
                break;
              }
            }
          }
        }
      }
      colorIndex++;
      if (colorIndex > 4) colorIndex = 0;
    }
  }

  void removeWord(int index) {
    setState(() {
      widget.wordList.removeAt(index);
    });
    refreshColorGrid();
    solveWordSearchPuzzle();
  }

  void refreshColorGrid() {
    _colorGrid = buildColorGrid();
    _colorList = gridToList(_colorGrid);
  }

  @override
  void initState() {
    _gridDimensions = widget.puzzleGrid.length;
    _wordCount = widget.wordList.length;
    _letterList = gridToList(widget.puzzleGrid);
    refreshColorGrid();
    solveWordSearchPuzzle();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SolverInterface oldWidget) {
    solveWordSearchPuzzle();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          SizedBox(
            width: 350,
            height: 350,
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
                      color: _colorList[index],
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: Center(
                      child: Text(
                        _letterList[index],
                        style: (_colorList[index] == kDarkCreamColor)
                            ? TextStyle(color: kDarkBrownColor)
                            : TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ); // Replace with your widget
              },
              itemCount: _letterList.length, // Total number of items
            ),
          ),
          Expanded(
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
                    child: WordListView(words: widget.wordList, onLongPress: removeWord),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
