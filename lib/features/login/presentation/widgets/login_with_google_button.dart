import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, BlocProvider;
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    show FaIcon, FontAwesomeIcons;
import 'package:mel/core.dart' show cYellow;
import 'package:mel/features/login.dart'
    show LoginBloc, LoginState, LoginWithFacebookPressed;

class LoginWithGoogleButton extends StatefulWidget {
  @override
  _LoginWithGoogleButtonState createState() => _LoginWithGoogleButtonState();
}

class _LoginWithGoogleButtonState extends State<LoginWithGoogleButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return IconButton(
          icon: FaIcon(
            FontAwesomeIcons.googlePlusG,
          ),
          iconSize: 40,
          color: cYellow,
          onPressed: dispatchLoginWithFacebook,
        );
      },
    );
  }

  void dispatchLoginWithFacebook() {
    BlocProvider.of<LoginBloc>(context).add(
      LoginWithFacebookPressed(),
    );
  }
}
