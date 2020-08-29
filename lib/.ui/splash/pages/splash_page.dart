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
  AuthController c = Get.find();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return RadialGradient(
                center: Alignment.topRight,
                radius: 2,
                colors: <Color>[
                  Colors.white,
                  cGrey,
                ],
                tileMode: TileMode.clamp,
              ).createShader(bounds);
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          _body(),
        ],
      ),
    );
  }

  Widget _body() {
    return Container(
      child: Center(
        child: Text(
          'Loading',
          style: tWelcome(),
        ),
      ),
    );
  }
}
