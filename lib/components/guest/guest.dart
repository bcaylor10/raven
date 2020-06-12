import 'package:flutter/material.dart';
import '../../components/buttons/primaryButton.dart';
import './login.dart';

class Guest extends StatelessWidget {
  
  void _loginPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return Login();
        },
      ),
    );
  }  

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image(image: AssetImage('assets/images/raven.png'), width: 250),
        SizedBox(
          width: double.infinity,
          height: 75.0,
        ),
        PrimaryButton(
          buttonText: 'Login',
          buttonFunction: _loginPage,
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

