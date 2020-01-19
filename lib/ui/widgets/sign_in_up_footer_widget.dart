import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mel/layouts.dart';
import 'package:mel/pages.dart' show ForgotPasswordPage, StepPage;
import 'package:mel/widgets.dart' show Button;

class SignInUpFooter extends AnimatedWidget {
  final PageController controller;

  SignInUpFooter({
    this.controller,
  }) : super(listenable: controller);

  Widget build(BuildContext context) {
    final initial = (controller.page == 0 || controller.page == null);
    return Row(
      mainAxisAlignment:
          initial ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
      children: <Widget>[
        _forgotPassword(context),
        Button(
          onPress: () {
            if (initial)
              _signIn(context);
            else
              _signUp(context);
          },
          color: initial ? Color(0xffF4985F) : Color(0xffE27BCE),
        ),
      ],
    );
  }

  Future<void> _signIn(context) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FeedTabLayout()),
    );
  }

  Future<void> _signUp(context) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StepPage()),
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return Expanded(
      child: AnimatedOpacity(
        opacity: (controller.page == 0 || controller.page == null) ? 1.0 : 0.0,
        duration: Duration(milliseconds: 250),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              if (controller.page == 0)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                );
            },
            child: Container(
              child: Text(
                'Forgot password?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
