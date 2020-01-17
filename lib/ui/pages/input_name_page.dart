import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mel/pages.dart' show InputBirthdatePage;
import 'package:mel/widgets.dart' show Button, CutomBackButton, InputField;

class InputNamePage extends StatelessWidget {
  final COLOR_THEME = Color(0xffE27BCE);

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
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            _header(context),
                          ],
                        ),
                        SizedBox(
                          height: 110,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: bottom,
                          ),
                          child: _inputName(),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        _note(context),
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
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InputBirthdatePage()),
                  );
                },
              ),
            ),
          ],
        ),
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
    return new RichText(
      text: TextSpan(
        text: 'Your',
        style: GoogleFonts.quicksand(
          color: Colors.black,
          fontSize: 40,
        ),
        children: <TextSpan>[
          TextSpan(
            text: ' Name',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w900,
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
        'Your name will be displayed on your content and profile',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _inputName() {
    return Row(
      children: <Widget>[
        Expanded(
          child: InputField(
              labelText: 'first name', color: COLOR_THEME, autocorrect: true),
        ),
        SizedBox(
          width: 30,
        ),
        Expanded(
          child: InputField(
              labelText: 'last name', color: COLOR_THEME, autocorrect: true),
        ),
      ],
    );
  }

  Widget _note(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 60,
      child: new Text(
        'Note: Providing a real name will help other users to find and contact your.',
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 14,
          color: Colors.black45,
        ),
      ),
    );
  }
}
