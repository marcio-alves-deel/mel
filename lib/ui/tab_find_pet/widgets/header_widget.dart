import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mel/controllers.dart';
import 'package:mel/models.dart';
import 'package:skeleton_text/skeleton_text.dart';

const AVATAR_WIDTH = 40.0;
const AVATAR_HEIGHT = 40.0;
const ICON_SIZE = 20.0;

class FindPetHeader extends StatelessWidget {
  FindPetHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GetX<AuthController>(builder: (_) {
          if (!(_.getState is Loaded)) {
            return Container();
          }
          UserModel user = _.getCurrent;

          return CachedNetworkImage(
            imageUrl: user.picture.url,
            imageBuilder: (context, imageProvider) => Container(
              width: AVATAR_WIDTH,
              height: AVATAR_HEIGHT,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => SkeletonAnimation(
              child: Container(
                width: AVATAR_WIDTH,
                height: AVATAR_HEIGHT,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          );
        }),
        IconButton(
          icon: Icon(
            LineIcons.cog,
            size: ICON_SIZE,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
