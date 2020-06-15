import 'package:flutter/material.dart';
import '../../components/buttons/primaryButton.dart';

class Guest extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image(image: AssetImage('assets/images/raven.png'), width: 250),
        SizedBox(
          width: double.infinity,
          height: 75.0,
        ),
        SizedBox(
          width: double.infinity,
          child: PrimaryButton(
            buttonText: 'Login',
            buttonFunction: () => {
              Navigator.of(context).pushNamed('/login'),
            },
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 20.0,
        ),
        SizedBox(
          width: double.infinity,
          child: PrimaryButton(
            buttonText: 'Register',
            buttonFunction: () => {
              Navigator.of(context).pushNamed('/register'),
            },
          ),
        ),
      ],
    );
  }
}
