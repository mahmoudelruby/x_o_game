import 'package:flutter/material.dart';
import 'package:x_o_game/board_screen.dart';

void main() {
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {BoardScreen.routeName: (buildContext) => BoardScreen()},
      initialRoute: BoardScreen.routeName,
    );
  }
}
