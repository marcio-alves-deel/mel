import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mel/widgets.dart' show Button, CutomBackButton, inputField;

class ForgotPasswordPage extends StatefulWidget {
  @override
  State createState() => new ForgotPasswordPageState();
}

class ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final COLOR_THEME = Color(0xff5FD2F4);

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    return new Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: CutomBackButton(context: context),
      body: new GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: new Stack(
          children: <Widget>[
            Center(
              child: new SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            _header(),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: bottom,
                          ),
                          child: _forgotPasswordForm(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              right: 30,
              child: Button(
                color: COLOR_THEME,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _title(),
        SizedBox(
          height: 10,
        ),
        _subtitle(),
      ],
    );
  }

  Widget _title() {
    return new RichText(
      text: TextSpan(
        text: 'Forgot',
        style: GoogleFonts.quicksand(
          color: Colors.black,
          fontSize: 30,
        ),
        children: <TextSpan>[
          TextSpan(
            text: ' Password?',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _subtitle() {
    return Container(
      width: 250,
      child: new Text(
        'Enter your email below and we will email you with instructions to reset your password!   ',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _forgotPasswordForm() {
    return Column(
      children: <Widget>[
        inputField(
          color: COLOR_THEME,
          hintText: 'enter your email',
        ),
      ],
    );
  }
}
