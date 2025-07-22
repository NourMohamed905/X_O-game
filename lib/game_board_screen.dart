import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'board_item.dart';

class GameBoardScreen extends StatefulWidget {
  static const String routeName = '/game_board';

  @override
  State<GameBoardScreen> createState() => _GameBoardScreenState();
}

class _GameBoardScreenState extends State<GameBoardScreen> {

  List<String> board = List.filled(9, '');
  late String player1Symbol ;
  late String player2Symbol = player1Symbol == 'x' ? 'o' : 'x';
  int player1Score = 0;
  int player2Score = 0;

  @override
  Widget build(BuildContext context) {
   player1Symbol = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xFF00D2FF), Color(0xFF3A7BD5)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(44),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '${player1Symbol.toUpperCase()} : $player1Score',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      '${player2Symbol.toUpperCase()} : $player2Score',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 32,
                      ),
                    )
                  ],
                ),
              ),
              Text(
                " ${round.isOdd ? player1Symbol.toUpperCase() : player2Symbol.toUpperCase()}'s turn ",
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(44),
                ),
                clipBehavior: Clip.antiAlias,
                height: MediaQuery.sizeOf(context).height * 0.75,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: MediaQuery.sizeOf(context).height * 0.25,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                  ),
                  itemBuilder: (_, index) => BoardItem(
                    text: board[index],
                    index: index,
                    onPressed: onItemClicked,
                  ),
                  itemCount: 9,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int round = 1;
  void onItemClicked(int index) {
    if (round.isOdd) {
      board[index] = player1Symbol;
      if( checkWinner(player1Symbol)){
        player1Score++;
        clearBoard();
        return;
      }
    } else {
      board[index] = player2Symbol;
      if( checkWinner(player2Symbol)){
        player2Score++;
        clearBoard();
        return;
      }
    }
    round++;
    if(round == 10 ){
      // Draw
      clearBoard();
      return;
    }
    setState(() {});
  }

  bool checkWinner(String symbol) {
    if(round < 5 ){
      return false;
    }
    if (board[0] == symbol && board[4] == symbol && board[8] == symbol) {
      return true;
    }
    if (board[2] == symbol && board[4] == symbol && board[6] == symbol) {
      return true;
    }
    for (int i = 0; i <= 6; i += 3) {
      if (board[i] == symbol &&
          board[i + 1] == symbol &&
          board[i + 2] == symbol) {
        return true;
      }
    }

    for (int i = 0; i <= 2; i++) {
      if (board[i] == symbol &&
          board[i + 3] == symbol &&
          board[i + 6] == symbol) {
        return true;
      }
    }
    return false;
  }

  void clearBoard(){
    board = List.filled(9, '');
    round = 1 ;
    setState(() {});
  }
}
