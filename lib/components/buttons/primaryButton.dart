import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final Function buttonFunction;

  PrimaryButton({this.buttonText, this.buttonFunction});
  
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: buttonFunction,
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 20)
      ),
      textColor: Colors.white,
      color: Colors.teal[500],
      elevation: 10.0,
      padding: EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 20.0),
      splashColor: Colors.teal[800],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
      ),
    );
  } 
}