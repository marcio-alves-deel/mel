import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mel/widgets.dart' show inputField;

class SignUpPage extends StatefulWidget {
  @override
  State createState() => new SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final COLOR_THEME = Color(0xffE27BCE);

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    return Center(
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
                  child: _signUpForm(),
                ),
              ],
            ),
          ),
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
        text: 'Hello,',
        style: GoogleFonts.quicksand(
          color: Colors.black,
          fontSize: 40,
          fontWeight: FontWeight.w400,
        ),
        children: <TextSpan>[
          TextSpan(
            text: ' Dear',
            style: TextStyle(
              fontSize: 40,
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
        'Fill the form below \nin order to create your account',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _signUpForm() {
    return Column(
      children: <Widget>[
        inputField(
          labelText: 'Email',
          color: COLOR_THEME,
          hintText: 'enter a valid email',
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(
          height: 15,
        ),
        inputField(
          labelText: 'Password',
          color: COLOR_THEME,
          obscureText: true,
          hintText: 'create a password',
        ),
        SizedBox(
          height: 15,
        ),
        inputField(
            labelText: 'Password confirmation',
            color: COLOR_THEME,
            obscureText: true,
            hintText: 'confirm your password'),
      ],
    );
  }
}
