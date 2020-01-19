import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mel/layouts.dart' show FeedTabLayout;
import 'package:mel/widgets.dart' show Button;

class AccountCreatedPage extends StatelessWidget {
  final COLOR_THEME = Color(0xffE27BCE);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: new Stack(
        children: <Widget>[
          Positioned.fill(
            bottom: 150,
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
                  MaterialPageRoute(builder: (context) => FeedTabLayout()),
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
      ],
    );
  }

  Widget _title() {
    return new Text(
      'All done!',
      style: GoogleFonts.quicksand(
        color: Colors.black,
        fontSize: 32,
      ),
    );
  }

  Widget _subtitle() {
    return Container(
      width: 250,
      child: new Text(
        'Congratulations! Now you are ready to start using Mel We are glad to have you here! Please, remember to be nice and kind with the others!',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
