import 'package:flutter/material.dart';
import './components/guest/guest.dart';
import './components/guest/login.dart';
import './components/guest/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Raven',
      theme:
          ThemeData(primaryColor: Colors.black, accentColor: Colors.teal[400]),
      home: Scaffold(
        appBar: AppBar(title: Text('Raven')),
        body: Container(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[Guest()],
          ),
        ),
      ),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => Login(),
        '/register': (BuildContext context) => Register(),
      },
    );
  }
}
