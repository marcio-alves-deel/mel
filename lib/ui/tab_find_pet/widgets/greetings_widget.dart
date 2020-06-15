import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mel/controllers.dart' show AuthController, Loaded;
import 'package:mel/core.dart' show tTitle, tSubTitle, cGrey;
import 'package:mel/models.dart' show UserModel;
import 'package:skeleton_text/skeleton_text.dart';

const GREETINGS_WIDTH = 270.0;

class PageGreetings extends StatelessWidget {
  PageGreetings();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _getTitle(context),
            SizedBox(
              height: 10,
            ),
            Container(
              width: GREETINGS_WIDTH,
              child: Text(
                'We have Pets waiting for you',
                style: tTitle(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _getTitle(context) {
    return GetX<AuthController>(
      builder: (_) {
        if (_.getState is Loaded) {
          final UserModel user = _.getCurrent;
          return Text(
            'Hi, ${user.firstName} ${user.lastName}',
            style: tSubTitle(),
          );
        }

        return SkeletonAnimation(
          child: Container(
            height: 15,
            width: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), color: cGrey),
          ),
        );
      },
    );
  }
}