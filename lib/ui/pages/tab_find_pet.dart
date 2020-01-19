import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mel/widgets.dart';

class FindPetTab extends StatefulWidget {
  @override
  _FindPetTabState createState() => _FindPetTabState();
}

class _FindPetTabState extends State<FindPetTab> {
  final COLOR_THEME = Color(0xffE27BCE);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: <Widget>[
              _header(),
              SizedBox(
                height: 60,
              ),
              _greeting(),
              SizedBox(
                height: 30,
              ),
              Row(
                children: <Widget>[],
              ),
              Filters()
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _profilePicture(),
        _settings(),
      ],
    );
  }

  Widget _profilePicture() {
    return Container(
      child: Container(
        width: 40.0,
        height: 40.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: COLOR_THEME.withAlpha(30),
              spreadRadius: 3,
              blurRadius: 5,
            ),
          ],
          image: new DecorationImage(
            fit: BoxFit.fill,
            image: new NetworkImage("https://i.imgur.com/BoN9kdC.png"),
          ),
        ),
      ),
    );
  }

  Widget _settings() {
    return IconButton(
      icon: Icon(
        LineIcons.cog,
        size: 20,
      ),
      onPressed: () {},
    );
  }

  Widget _greeting() {
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(
              'Hello, John Doe',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 230,
              child: Text(
                'We have Pets waiting for you',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
