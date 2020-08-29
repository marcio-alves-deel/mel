import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mel/core/constants/colors.dart';
import 'package:mel/core/constants/typography.dart';
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
      body: Stack(
        children: <Widget>[
          Opacity(
            opacity: 1,
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return RadialGradient(
                  center: Alignment.topRight,
                  radius: 3,
                  colors: <Color>[
                    Colors.white,
                    Colors.white,
                    cGrey,
                    cBlack,
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
          ),
          Positioned.fill(
            bottom: 50,
            child: _body(),
          ),
        ],
      ),
    );
  }

  Widget _body() {
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SignInHeader(),
          SizedBox(
            height: 50,
          ),
          Container(
            width: 250,
            child: Text(
              'Please sign in with one of your social networks to start',
              style: tSubTitle(18),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SignInMethod(),
        ],
      ),
    );
  }
}
