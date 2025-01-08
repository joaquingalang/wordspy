import 'dart:math';
import 'package:string_validator/string_validator.dart';
import 'package:flutter/material.dart';
import 'package:wordspy/screens/solver_screen.dart';
import 'package:wordspy/utils/constants.dart';
import 'package:wordspy/services/scanner.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Scanner _puzzleScanner = Scanner();

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

  List<String> getPuzzleLetters(List<String> body) {
    String scannedLetters = body.join();
    List<String> puzzleLetters = [];
    for (int i = 0; i < scannedLetters.length; i++) {
      String letter = scannedLetters[i];
      if (isAlpha(letter)) {
        puzzleLetters.add(letter.toUpperCase());
      } else if (isNumeric(letter)) {
        switch (letter) {
          case "0":
            puzzleLetters.add("O");
            break;
          case "1":
            puzzleLetters.add("I");
            break;
          case "2":
            puzzleLetters.add("Z");
            break;
          case "3":
            puzzleLetters.add("E");
            break;
          case "4":
            puzzleLetters.add("F");
            break;
          case "5":
            puzzleLetters.add("S");
            break;
          case "6":
            puzzleLetters.add("G");
            break;
          case "7":
            puzzleLetters.add("T");
            break;
          case "8":
            puzzleLetters.add("B");
            break;
          case "9":
            puzzleLetters.add("P");
            break;
        }
      } else {
        if (letter == '|') puzzleLetters.add('I');
      }
    }
    return puzzleLetters;
  }

  List<List<String>> buildPuzzleGrid(List<String> puzzleLetters) {
    int gridDimensions = sqrt(puzzleLetters.length).round();

    List<List<String>> puzzleGrid = [];
    for (int i = 0; i < gridDimensions; i++) {
      List<String> row = [];
      for (int j = 0; j < gridDimensions; j++) {
        String letter = puzzleLetters[(i * gridDimensions) + j];
        row.add(letter);
      }
      print(row);
      puzzleGrid.add(row);
    }
    return puzzleGrid;
  }

  // VER 2
  // List<List<String>> buildPuzzleGrid(List<String> body) {
  //   int gridDimensions = sqrt(body[0].replaceAll(' ', '').length).round();
  //   List<List<String>> puzzleGrid = [];
  //   for (String line in body) {
  //     line = line.replaceAll(' ', '');
  //     if (line.length < gridDimensions) continue;
  //     List<String> row = [];
  //     for (int i = 0; i < line.length; i++) {
  //       String letter = line[i];
  //       if (isAlpha(letter)) {
  //         row.add(letter.toUpperCase());
  //       } else if (letter == '0') {
  //         row.add('O');
  //       }
  //     }
  //     print(row);
  //     puzzleGrid.add(row);
  //   }
  //   return puzzleGrid;
  // }

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
        child: Center(
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
          onPressed: () async {
            List<String>? body =
                await _puzzleScanner.pickImage(ImageSource.camera);
            print(body);
            List<String> puzzleLetters = getPuzzleLetters(body!);
            List<List<String>> puzzleGrid = buildPuzzleGrid(puzzleLetters);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SolverScreen(
                  puzzleGrid: puzzleGrid,
                  wordList: [],
                ),
              ),
            );
          },
          child: Icon(
            Icons.add_a_photo_outlined,
            color: kDeepPurpleColor,
            size: 45,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
