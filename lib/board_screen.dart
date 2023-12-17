import 'package:flutter/material.dart';
import 'package:x_o_game/board_button.dart';
import 'package:x_o_game/board_header.dart';

class BoardScreen extends StatefulWidget {
  static const String routeName = 'board';

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  List<String> textButtonState = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  int countOfUserButtn = 0;
  int player1Score = 0;
  int player2Score = 0;

  userButtonClickFun(int position) {
    setState(() {
      if (textButtonState[position].isNotEmpty) return;
      if (countOfUserButtn.isEven) {
        textButtonState[position] = 'X';
      } else {
        textButtonState[position] = 'O';
      }
      countOfUserButtn++;
      if (checkwinner('X')) {
        resetBoard();
        player1Score++;

        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Congratualtion ^~^ "),
                content: Text("player 1 win "),
              );
            });
      } else if (checkwinner('O')) {
        resetBoard();
        player2Score++;
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Congratuation ! "),
                content: Text("player 2 win"),
              );
            });
      }
    });
  }

  void resetBoard() {
    textButtonState = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ];
    countOfUserButtn = 0;
  }

  bool checkwinner(String playerSymbol) {
    //check for row
    for (int i = 0; i < 9; i++) {
      if (textButtonState[i + 0] == playerSymbol &&
          textButtonState[i + 1] == playerSymbol &&
          textButtonState[i + 2] == playerSymbol) return true;
    }
    // check for column
    for (int i = 0; i < 3; i++) {
      if (textButtonState[i + 0] == playerSymbol &&
          textButtonState[i + 3] == playerSymbol &&
          textButtonState[i + 6] == playerSymbol) return true;
    }
    if (textButtonState[0] == playerSymbol &&
        textButtonState[4] == playerSymbol &&
        textButtonState[8] == playerSymbol) return true;
    if (textButtonState[2] == playerSymbol &&
        textButtonState[4] == playerSymbol &&
        textButtonState[6] == playerSymbol) return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          " X O Game ",
          style: TextStyle(color: Colors.red),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                BoardHeader(
                  playerNumber: 1,
                  playerScore: player1Score,
                  playerSymbol: 'X',
                ),
                BoardHeader(
                  playerNumber: 2,
                  playerScore: player2Score,
                  playerSymbol: 'O',
                )
              ],
            ),
          ),
          Expanded(
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              BoardButton(textButtonState[0], userButtonClickFun, 0),
              BoardButton(textButtonState[1], userButtonClickFun, 1),
              BoardButton(textButtonState[2], userButtonClickFun, 2),
            ]),
          ),
          Expanded(
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              BoardButton(textButtonState[3], userButtonClickFun, 3),
              BoardButton(textButtonState[4], userButtonClickFun, 4),
              BoardButton(textButtonState[5], userButtonClickFun, 5),
            ]),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(textButtonState[6], userButtonClickFun, 6),
                BoardButton(textButtonState[7], userButtonClickFun, 7),
                BoardButton(textButtonState[8], userButtonClickFun, 8)
              ],
            ),
          )
        ],
      ),
    );
  }
}
