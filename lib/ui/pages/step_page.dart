import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mel/pages.dart' show InputNamePage;
import 'package:mel/widgets.dart' show Button, CutomBackButton, InputField;

class StepPage extends StatelessWidget {
  final COLOR_THEME = Color(0xffE27BCE);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: new Stack(
        children: <Widget>[
          Positioned.fill(
            top: 50,
            child: Container(
              width: double.infinity,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        _header(context),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 30,
            child: Button(
              color: COLOR_THEME,
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InputNamePage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _title(),
        SizedBox(
          height: 10,
        ),
        _subtitle(),
        SizedBox(
          height: 70,
        ),
        _note(context),
      ],
    );
  }

  Widget _title() {
    return new Text(
      'Few Steps!',
      style: GoogleFonts.quicksand(
        color: Colors.black,
        fontSize: 40,
      ),
    );
  }

  Widget _subtitle() {
    return Container(
      width: 250,
      child: new Text(
        'Now that you have your account let’s continue with some steps to create your profile',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _note(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 60,
      child: new Text(
        'Note: All the fields are required to provide you a better experience with Mel.',
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 14,
          color: Colors.black45,
        ),
      ),
    );
  }
}
