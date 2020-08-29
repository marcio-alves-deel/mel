import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mel/core.dart';

class PetCardDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Pet Name',
          style: tThinWhite(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              LineIcons.map_marker,
              color: Colors.white.withAlpha(700),
              size: 11,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Porto, Porto',
              style: tThinWhite(14),
            ),
          ],
        ),
      ],
    );
  }
}
