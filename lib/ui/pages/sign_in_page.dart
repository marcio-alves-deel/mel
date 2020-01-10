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
    return new Container(
      width: double.infinity,
      color: Colors.white,
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
              height: 100,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: bottom > 0.0 ? bottom - 130 : bottom,
                ),
                child: _signInForm(),
              ),
            ),
            _footer()
          ],
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
    return new Text(
      'Welcome,',
      style: TextStyle(
        fontSize: 40,
      ),
    );
  }

  Widget _subtitle() {
    return Container(
      width: 170,
      child: new Text(
        'Enter your credentials to start using Mel',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _signInForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Column(
        children: <Widget>[
          InputField(
              labelText: 'Email',
              color: COLOR_THEME,
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
      ),
    );
  }

  Widget _footer() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 110,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[_forgotPassword(), Button(color: COLOR_THEME)],
        ),
      ],
    );
  }

  Widget _forgotPassword() {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Text(
            'Forgot password?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
