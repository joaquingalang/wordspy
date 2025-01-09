import 'package:flutter/material.dart';
import 'package:wordspy/utils/constants.dart';
import 'package:wordspy/screens/solver_screen.dart';
import 'package:wordspy/screens/home_screen.dart';

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

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SolverScreen(puzzleGrid: puzzleGrid, wordList: wordList),
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: kCreamColor,
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
        ),
        bottomAppBarTheme: BottomAppBarTheme(
            color: kDeepPurpleColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}