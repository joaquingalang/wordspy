import 'package:flutter/material.dart';
import 'package:wordspy/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          onPressed: () {},
          child: Icon(
            Icons.add_a_photo_outlined,
            color: kDeepPurpleColor,
            size: 40,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
