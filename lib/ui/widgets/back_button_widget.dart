import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

Widget CutomBackButton({@required BuildContext context}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: Padding(
      padding: const EdgeInsets.only(left: 14.0),
      child: InkWell(
        customBorder: CircleBorder(),
        child: Icon(
          LineIcons.long_arrow_left,
          color: Colors.black,
          size: 26,
        ),
        onTap: () => Navigator.of(context).pop(true),
      ),
    ),
  );
}
