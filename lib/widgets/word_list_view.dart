import 'package:flutter/material.dart';
import 'package:wordspy/utils/constants.dart';
import 'package:wordspy/widgets/word_tile.dart';

class WordListView extends StatelessWidget {
  const WordListView({super.key, required this.words});

  final List<String> words;

  List<Widget> buildWordListView() {
    List<Widget> wordListView = [];
    List<Widget> rowContent = [];
    int colorIndex = 0;
    for (int i = 0; i < words.length; i++) {
      if (colorIndex > 4) colorIndex = 0;
      Color currentColor = getColorByIndex(colorIndex);
      Widget wordTile = WordTile(
        color: currentColor,
        word: words[i],
      );
      rowContent.add(wordTile);
      if (rowContent.length >= 2) {
        Widget row = Row(
          children: rowContent,
        );
        wordListView.add(row);
        rowContent = [];
      }
      colorIndex++;
    }
    if (rowContent.isNotEmpty) {
      Widget fillerWidget = Expanded(child: SizedBox());
      rowContent.add(fillerWidget);
      Widget row = Row(
        children: rowContent,
      );
      wordListView.add(row);
    }
    return wordListView;
  }

  Color getColorByIndex(int index) {
    switch (index) {
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

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: buildWordListView(),
    );
  }
}


