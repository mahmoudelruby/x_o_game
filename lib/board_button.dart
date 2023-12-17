import 'package:flutter/material.dart';
///this ui button
class BoardButton extends StatelessWidget {
  String txtButton;
  Function clickbutton;
  int position;
  BoardButton(this.txtButton, this.clickbutton,this.position) {}

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
          onPressed: () {
            clickbutton(position);
          },
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1),
                      side: const BorderSide(color: Colors.red)))),
          child: Text(
            txtButton,
            style: TextStyle(fontSize: 30, color: Colors.deepPurple),
          )),
    );
  }
}
