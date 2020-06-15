import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mel/controllers.dart';
import 'package:mel/core.dart';

class SplashPage extends StatefulWidget {
  @override
  State createState() => new SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              cPinkLight,
              cOrange,
            ],
          ),
        ),
        child: GetX<AuthController>(
          builder: (_) {
            return _body();
          },
        ),
      ),
    );
  }

  Widget _body() {
    return Container(
      child: Center(
        child: Text('Loading'),
      ),
    );
  }
}
