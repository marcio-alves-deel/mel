import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Messages',
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
          ),
        ),
        IconButton(
          icon: Icon(LineIcons.search),
          onPressed: () {},
        )
      ],
    );
  }
}
