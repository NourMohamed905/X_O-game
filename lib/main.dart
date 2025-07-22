import 'package:flutter/material.dart';
import 'package:x_o/game_board_screen.dart';
import 'package:x_o/welcome_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {

        GameBoardScreen.routeName : (_) => GameBoardScreen(),
        WelcomeScreen.routeName : (_) => WelcomeScreen(),
      },
      initialRoute: GameBoardScreen.routeName ,
    );
  }
}
