import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mel/core.dart' show cDarkAccent;
import 'package:mel/widgets.dart' show TextSSerif;

class FeedGreetings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double feedUserGreetingTextSize =
        MediaQuery.of(context).size.height * 0.015;
    double feedGreetingTextSize = MediaQuery.of(context).size.height * 0.02;
    double feedGreetingWidth = MediaQuery.of(context).size.height * 0.2;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // TextSSerif(
            //   'Hello Marcio,',
            //   textAlign: TextAlign.start,
            //   textStyle: TextStyle(
            //     fontSize: feedUserGreetingTextSize,
            //     fontWeight: FontWeight.w200,
            //   ),
            // ),
            // Container(
            //   width: feedGreetingWidth,
            //   child: TextSSerif(
            //     'We have pets waiting for you',
            //     textAlign: TextAlign.start,
            //     textStyle: TextStyle(
            //       color: cDarkAccent,
            //       fontSize: feedGreetingTextSize,
            //       fontWeight: FontWeight.w800,
            //     ),
            //   ),
            // ),
            Container(
              width: feedGreetingWidth,
              child: TextSSerif(
                'Your little friend is waiting for you!',
                textAlign: TextAlign.center,
                textStyle: TextStyle(
                  color: cDarkAccent,
                  fontSize: feedGreetingTextSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     Icon(
            //       LineIcons.map_marker,
            //       size: 10,
            //     ),
            //     SizedBox(
            //       height: 20,
            //       width: 5,
            //     ),
            //     TextSSerif(
            //       'Porto, Portugal',
            //       textAlign: TextAlign.start,
            //       textStyle: TextStyle(
            //         fontSize: 13,
            //         fontWeight: FontWeight.w200,
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ],
    );
  }
}
