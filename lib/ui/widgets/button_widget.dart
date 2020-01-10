import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart' show LineIcons;

Widget Button({String text, Color color = Colors.black}) {
  return Container(
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(6),
      boxShadow: [
        BoxShadow(
          color: color.withAlpha(30),
          spreadRadius: 7,
          blurRadius: 7,
        ),
      ],
    ),
    child: new Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(12.0),
          child: Icon(
            LineIcons.long_arrow_right,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}

class LineIcon {}
