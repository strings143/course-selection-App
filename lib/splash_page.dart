import 'package:flutter/material.dart';
import 'dart:async';
import 'login.dart';
// ignore_for_file: prefer_const_constructors
class SplashPage extends StatefulWidget {
  State<StatefulWidget> createState() => _SplashPageState();

}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 2),
            () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => first()),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.lightGreen,
        height: 850,
        width: 500,
        child: new Column(children: <Widget>[
          Divider(
            height: 240.0,

          ),
          new Image.asset(
            'assets/dyu.jpg',
            fit: BoxFit.cover,
            repeat: ImageRepeat.noRepeat,
            width: 170.0,
          ),
          Divider(
            height: 105.2,

          ),
        ]),
      ),
    );
  }
}

