import 'package:flutter/material.dart';
import 'package:mel/core.dart';

var tTitle = ([double fontSize]) => TextStyle(
      fontSize: fontSize ?? 36,
      fontWeight: FontWeight.w600,
      color: cPinkDark,
    );

var tSubTitle = ([double fontSize]) => TextStyle(
      fontSize: fontSize ?? 16.0,
      fontWeight: FontWeight.w200,
      color: cWhite,
    );

var tThinWhite = ([double fontSize]) => TextStyle(
      color: Colors.white,
      fontSize: fontSize ?? 20,
      fontWeight: FontWeight.w100,
    );

var tWelcome = ([double fontSize]) => TextStyle(
      color: cWhite,
      fontSize: fontSize ?? 40,
    );

var tWelcomeSub = ([double fontSize]) => TextStyle(
      color: cWhite,
      fontSize: fontSize ?? 16,
    );
