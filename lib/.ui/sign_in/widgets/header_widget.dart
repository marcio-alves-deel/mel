import 'package:flutter/material.dart';
import 'package:mel/core.dart';

class SignInHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text(
              'Welcome to mel,',
              style: tWelcome(),
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
                  new Text(
                    'We have a mission to help each litle animal find a home',
                    style: tSubTitle(),
                    textAlign: TextAlign.center,
                  ),
                  new Text(
                    'Join Us!',
                    style: tSubTitle(20),
                    textAlign: TextAlign.center,
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
