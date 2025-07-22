import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:x_o/game_board_screen.dart';
import 'package:x_o/symbol.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName = '/welcome';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xFF00D2FF),
            Color(0xFF3A7BD5),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/images/back.png',
                  width: double.infinity,
                  ),
                  Text(
                    'Tix-Tac-Toe',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text(
                'Pick who goes first?',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 17,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SymbolSelection(symbol: 'x'),
                  SymbolSelection(symbol: 'o'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
