import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Form(child: 
      Column(
        children: <Widget>[
        TextFormField(
          decoration: InputDecoration(
              hintText: 'Enter your email',
            ),
          )
        ],
      )
    );
  }
}