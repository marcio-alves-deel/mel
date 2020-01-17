import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart' show LineIcons;

Widget Button({String text, Color color = Colors.black, onPress}) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 200),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(6),
      boxShadow: [
        BoxShadow(
          color: color.withAlpha(30),
          spreadRadius: 5,
          blurRadius: 10,
        ),
      ],
    ),
    child: new Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPress,
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
