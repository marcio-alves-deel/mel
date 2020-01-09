import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  State createState() => new SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
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
            _signInForm(),
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
      child: TextField(
        decoration: InputDecoration(labelText: 'Full name'),
      ),
    );
  }
}
