import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mel/pages.dart';
import 'package:mel/widgets.dart'
    show AvatarSelectWidget, Button, CutomBackButton;

class AvatarPage extends StatefulWidget {
  @override
  State createState() => new AvatarPageState();
}

class AvatarPageState extends State<AvatarPage> {
  final COLOR_THEME = Color(0xffE27BCE);
  File _image;

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
                    padding: const EdgeInsets.only(
                      left: 30.0,
                      right: 30.0,
                      bottom: 70.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                          child: _avatarView(),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        _details()
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
                        builder: (context) => AccountCreatedPage()),
                  );
                },
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
    return new Text(
      'Avatar',
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
        'You can select a picture to represent you on the comunity',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _avatarView() {
    return Column(
      children: <Widget>[
        AvatarSelectWidget(image: _image),
      ],
    );
  }

  Widget _details() {
    return Column(
      children: <Widget>[
        new Text(
          'John Doe',
          style: GoogleFonts.quicksand(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        new Text(
          'john.doe@example.com',
          style: GoogleFonts.quicksand(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
