import 'package:flutter/material.dart';
import 'package:mel/core/constants/colors.dart';
import 'package:mel/widgets.dart' show TextSSerif;

class FeedItemDescription extends StatelessWidget {
  FeedItemDescription({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextSSerif(
          'Doggo',
          textStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: cDarkAccent,
          ),
        ),
        TextSSerif(
          'Bonfim, Porto',
          textStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: cPinkDarker,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: 250,
          child: TextSSerif(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam nulla leo, efficitur non leo sed, venenatis tempus sed.',
            textAlign: TextAlign.center,
            textStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.black38),
          ),
        ),
      ],
    );
  }
}
