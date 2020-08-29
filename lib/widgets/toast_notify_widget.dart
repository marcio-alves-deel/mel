import 'package:flutter/material.dart';
import 'package:mel/core/constants/colors.dart';
import 'package:toast/toast.dart' show Toast;

void toastNotify(text, {@required BuildContext context}) {
  return Toast.show(
    text,
    context,
    duration: Toast.LENGTH_LONG,
    gravity: Toast.TOP,
    backgroundColor: cOrange,
    textColor: cWhite,
  );
}
