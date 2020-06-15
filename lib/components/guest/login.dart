import 'package:flutter/material.dart';
import '../buttons/primaryButton.dart';
import '../../models/authentication.dart';
import '../../components/spinners/loader.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _errorSnackBar = SnackBar(
      content: Text(
      'Unable to Login',
      textAlign: TextAlign.center,
    ),
  );

  Authentication authentication = new Authentication();
  
  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  _submitForm(BuildContext context) {
    final FormState form = _formKey.currentState;

    if (form.validate()) {
      _toggleLoading();
       authentication.login(emailController.text.trim(), passwordController.text.trim())
       .then((data) => {
         print('yeet'),
         _toggleLoading()
       })
       .catchError((e) => {
         print('yote'),
         _toggleLoading(),
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      });
    } else {
      // Scaffold.of(context).showSnackBar(_errorSnackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading ? Loader() : Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text('Login'),
      )),
      body: Builder(
        builder: (context) => Container(
          padding: EdgeInsets.fromLTRB(25, 0, 25, 25),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 25,
                    width: double.infinity,
                  ),
                  Image(
                      image: AssetImage('assets/images/raven.png'), width: 250),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ),
                    validator: (value) {
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value);

                      if (value.trim().isEmpty) {
                        return 'Email is required';
                      } else if (!emailValid) {
                        return 'Enter a valid email';
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Password"),
                    controller: passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value.trim().isEmpty) {
                        return 'Password is required';
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: PrimaryButton(
                        buttonFunction: () => _submitForm(context),
                        buttonText: 'Login',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: InkWell(
                      child: Text('Create an Account'),
                      onTap: () => {
                        Navigator.of(context).popAndPushNamed('/register'),
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}