import 'package:flutter/material.dart';

/// this is ui for view score
class BoardHeader extends StatelessWidget {
  int playerNumber;
  int playerScore;
  String playerSymbol;
  BoardHeader({required this.playerNumber,required this.playerScore,required this.playerSymbol}){}

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            child:  Center(
                child: Text(
      'Player $playerNumber ($playerSymbol)\n Score $playerScore',
      style: TextStyle(fontSize: 25,color: Colors.deepPurple,fontWeight: FontWeight.bold),
    ))));
  }
}
