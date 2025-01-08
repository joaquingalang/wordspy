import 'package:flutter/material.dart';
import 'package:wordspy/utils/constants.dart';
import 'package:wordspy/widgets/word_tile.dart';

class WordListView extends StatefulWidget {
  const WordListView({super.key, required this.words, required this.onLongPress});

  final List<String> words;
  final void Function(int) onLongPress;

  @override
  State<WordListView> createState() => _WordListViewState();
}

class _WordListViewState extends State<WordListView> {
  List<Widget> buildWordListView() {
    List<Widget> wordListView = [SizedBox(height: 5)];
    List<Widget> rowContent = [];
    int colorIndex = 0;
    for (int i = 0; i < widget.words.length; i++) {
      if (colorIndex > 4) colorIndex = 0;
      Color currentColor = getColorByIndex(colorIndex);
      Widget wordTile = WordTile(
        color: currentColor,
        word: widget.words[i],
        onLongPress: () {
          setState(() {
            widget.onLongPress(i);
          });
        },
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


