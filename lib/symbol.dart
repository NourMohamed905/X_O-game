import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:x_o/game_board_screen.dart';

class SymbolSelection extends StatelessWidget {

  String symbol;
  SymbolSelection ({required this.symbol});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(GameBoardScreen.routeName , arguments: symbol );
      },
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.2 ,
        padding: EdgeInsets.all(38),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Image.asset('assets/images/$symbol.png',fit: BoxFit.fill,),
      ),
    );
  }
}
