import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mel/widgets.dart' show Button, InputField;

class SignInPage extends StatefulWidget {
  @override
  State createState() => new SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  final COLOR_THEME = Color(0xffF4985F);

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _header(),
                SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: bottom,
                  ),
                  child: _signInForm(),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new Text(
          'Welcome,',
          style: TextStyle(
            fontSize: 40,
          ),
        ),
      ],
    );
  }

  Widget _subtitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 170,
          child: new Text(
            'Enter your credentials to start using Mel',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _signInForm() {
    return Column(
      children: <Widget>[
        InputField(
            labelText: 'Email',
            color: COLOR_THEME,
            keyboardType: TextInputType.emailAddress,
            hintText: 'enter your email'),
        SizedBox(
          height: 15,
        ),
        InputField(
          labelText: 'Password',
          color: COLOR_THEME,
          obscureText: true,
          hintText: 'enter your password',
        ),
      ],
    );
  }
}
