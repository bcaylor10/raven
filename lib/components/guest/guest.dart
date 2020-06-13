import 'package:flutter/material.dart';
import 'package:raven/components/guest/register.dart';
import '../../components/buttons/primaryButton.dart';
import './login.dart';

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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Login())),
              },
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 20.0,
          ),
          SizedBox(
            width:double.infinity,
              child: PrimaryButton(
              buttonText: 'Register',
              buttonFunction: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Register())),
              },
            ),
          ),
        ]
      );
  }
}
