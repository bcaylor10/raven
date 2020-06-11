import 'package:flutter/material.dart';
import '../../components/buttons/primaryButton.dart';

class Guest extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image(image: AssetImage('images/raven.png')),
        PrimaryButton(
          buttonText: 'Login',
          buttonFunction: null,
        ),
        SizedBox(
          width: double.infinity,
          height: 20.0,
        ),
        PrimaryButton(
          buttonText: 'Register',
          buttonFunction: null,
        )
      ]
    );
  }
}

