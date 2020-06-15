import 'package:flutter/material.dart';
import '../buttons/primaryButton.dart';
import '../../models/authentication.dart';
import '../../components/spinners/loader.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

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
      authentication.register(emailController.text.trim(), passwordController.text.trim())
      .then((data) => {
        print(data)
      })
      .catchError((e) => {
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
      print('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text('Register'),
      )),
      body: Builder(
        builder: (context) => _isLoading
            ? Loader()
            : Container(
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
                            image: AssetImage('assets/images/raven.png'),
                            width: 250),
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
                          height: 20,
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(hintText: "Confirm Password"),
                          controller: passwordConfirmController,
                          obscureText: true,
                          validator: (value) {
                            if (value.trim().isEmpty) {
                              return 'Password confirmation is required';
                            } else if (value.trim() !=
                                passwordController.text.trim()) {
                              return 'Passwords must match';
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
                              buttonText: 'Register',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
