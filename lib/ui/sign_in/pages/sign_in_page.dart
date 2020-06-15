import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mel/core.dart' show cPinkLight, cOrange;
import 'package:mel/ui.dart' show SignInHeader, SignInMethod;

class SignInPage extends StatefulWidget {
  @override
  State createState() => new SignInPageState();
}

class SignInPageState extends State<SignInPage> {
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
        child: Container(),
      ),
    );
  }

  Widget _body() {
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    return Stack(
      children: <Widget>[
        Positioned.fill(
          bottom: 150,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SignInHeader(),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: bottom,
                  ),
                  child: SignInMethod(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
