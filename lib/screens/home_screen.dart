import 'dart:math';
import 'package:flutter/material.dart';
import 'package:wordspy/utils/constants.dart';
import 'package:wordspy/screens/solver_screen.dart';
import 'package:wordspy/services/scanner.dart';
import 'package:wordspy/widgets/step_icon.dart';
import 'package:wordspy/widgets/scan_mode_dialog.dart';
import 'package:string_validator/string_validator.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Scanner _puzzleScanner = Scanner();
  ScanMode scanMode = ScanMode.none;

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

  Future<void> scanImage(ImageSource imageSource) async {
    List<String>? body = await _puzzleScanner.pickImage(imageSource);
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/logo.png', width: 200),
              Text(
                'WELCOME TO',
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 20,
                  letterSpacing: 5,
                ),
              ),
              Text(
                'WORDSPY',
                style: kXXLargeTextStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'A handy tool for solving word search puzzles in a flash! It\'s simple, just follow these steps:',
                style: TextStyle(
                  color: kPurpleColor,
                  fontFamily: 'SourceSansPro',
                  fontSize: 18,
                  letterSpacing: 1,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 10),
              IntrinsicHeight(
                child: Row(
                  children: [
                    StepIcon(
                      text: 'Scan a Photo',
                      iconData: Icons.add_photo_alternate_outlined,
                      color: kTealColor,
                    ),
                    VerticalDivider(color: kDarkCreamColor, thickness: 3),
                    StepIcon(
                      text: 'Add Words',
                      iconData: Icons.add_comment_rounded,
                      color: kYellowColor,
                    ),
                    VerticalDivider(color: kDarkCreamColor, thickness: 3),
                    StepIcon(
                      text: 'View Results',
                      iconData: Icons.remove_red_eye_outlined,
                      color: kOrangeColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100),
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
            setState(() {
              scanMode = ScanMode.none;
            });

            showDialog(
              context: context,
              builder: (context) => ScanModeDialog(
                onCamera: () async {
                  await scanImage(ImageSource.camera);
                },
                onGallery: () {
                  scanImage(ImageSource.gallery);
                },
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
