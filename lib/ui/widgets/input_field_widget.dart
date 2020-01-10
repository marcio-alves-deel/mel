import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_conditional_rendering/conditional.dart'
    show Conditional;

Widget InputField({
  String labelText = '',
  Color color = Colors.black,
  bool obscureText = false,
  String hintText = '',
}) {
  return Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            labelText.toUpperCase(),
            style: TextStyle(
              color: color,
              letterSpacing: 1.2,
              fontSize: 11,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
      TextFormField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: const Color(0xFFEDEDED)),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: const Color(0xFFEDEDED)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
          hintText: hintText,
        ),
        obscureText: obscureText,
        style: TextStyle(fontSize: 14),
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        enableSuggestions: true,
      ),
    ],
  );
}
