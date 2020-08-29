import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mel/core/constants/colors.dart';
import 'package:mel/data.dart' show User;
import 'package:mel/features/home/home.dart';
import 'package:skeleton_text/skeleton_text.dart';

const IMAGE_WIDTH = 90.0;
const IMAGE_HEIGHT = 90.0;

class MenuAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is HomeSuccess)
        return CachedNetworkImage(
          imageUrl: (state.props[0] as User).picture.url,
          imageBuilder: (context, imageProvider) => Container(
            width: IMAGE_WIDTH,
            height: IMAGE_HEIGHT,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
              boxShadow: [
                new BoxShadow(
                  color: cPinkDarker,
                  offset: new Offset(10.0, 10.0),
                  blurRadius: 10,
                )
              ],
            ),
          ),
          placeholder: (context, url) => SkeletonAnimation(
            child: Container(
              width: IMAGE_WIDTH,
              height: IMAGE_HEIGHT,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
            ),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        );

      return Container();
    });
  }
}
