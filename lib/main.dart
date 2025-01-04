import 'package:flutter/material.dart';
import 'package:wordspy/utils/constants.dart';
import 'package:wordspy/screens/home_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
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
