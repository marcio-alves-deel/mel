import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mel/core.dart' show cPinkDark, cPinkDarker, cPinkLight;

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          _shader(),
          Positioned.fill(
            child: Center(
              child: Text(
                'Mel',
              ),
            ),
          ),
          Positioned.fill(
            bottom: 0,
            child: _copyrights(),
          ),
        ],
      ),
    );
  }

  Widget _shader() {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return RadialGradient(
          center: Alignment.topRight,
          radius: 2,
          colors: <Color>[cPinkLight, cPinkLight, cPinkDarker],
          tileMode: TileMode.clamp,
        ).createShader(bounds);
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [cPinkLight, cPinkDark],
          ),
        ),
      ),
    );
  }

  Widget _copyrights() {
    return SafeArea(
      child: Center(
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Text(
            'Copyright Mel © 2020',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: cPinkDark,
            ),
          ),
        ),
      ),
    );
  }
}
