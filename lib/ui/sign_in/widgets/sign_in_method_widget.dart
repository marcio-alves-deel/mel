import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mel/controllers.dart';

class SignInMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
            icon: FaIcon(FontAwesomeIcons.facebook),
            iconSize: 40,
            onPressed: () async {
              // await AuthController.to.authenticateFacebook();
              // AuthController.to.displayMessage(context);
            }),
        SizedBox(
          width: 15,
        ),
        IconButton(
            icon: FaIcon(FontAwesomeIcons.google),
            iconSize: 40,
            onPressed: () {
              print("Pressed");
            })
      ],
    );
  }
}
