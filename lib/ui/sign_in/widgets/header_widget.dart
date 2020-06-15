import 'package:flutter/material.dart';
import 'package:mel/core.dart';

class SignInHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Text(
              'Welcome,',
              style: tWelcome(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 200,
              child: new Text(
                'Use your social accounts to connect with Mel',
                style: tWelcomeSub(),
              ),
            ),
          ],
        )
      ],
    );
  }
}
