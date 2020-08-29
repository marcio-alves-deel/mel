import 'package:flutter/material.dart';
import 'package:mel/core.dart' show cPinkLight, cWhite;
import 'package:mel/widgets.dart' show TextSerif;

class LoginHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new TextSerif(
              'Welcome to mel,',
              textStyle: new TextStyle(
                color: cWhite,
                fontSize: 38,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              child: Column(
                children: <Widget>[
                  new TextSerif(
                    'Our mission is to find a home to all little ones',
                    textAlign: TextAlign.center,
                    textStyle: new TextStyle(
                      fontSize: 16,
                      color: cPinkLight,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  new TextSerif(
                    'Join Us!',
                    textStyle: TextStyle(
                      color: cWhite,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
