import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mel/core.dart';
import 'package:toast/toast.dart';

const BUTTON_WIDTH = 40.0;
const BUTTON_HEIGHT = 40.0;
const BORDER_RADIUS = 30.0;

class PetFavorite extends StatefulWidget {
  @override
  _PetFavoriteState createState() => _PetFavoriteState();
}

class _PetFavoriteState extends State<PetFavorite> {
  bool isFavorite = false;

  _onFavorite() {
    Toast.show(
      isFavorite ? "Pet removed from favorite!" : "Pet added to favorite!",
      context,
      duration: Toast.LENGTH_SHORT,
      gravity: Toast.BOTTOM,
      backgroundColor: cPinkLight,
      textColor: cWhite,
    );
    setState(() {
      isFavorite = isFavorite ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: BUTTON_WIDTH,
      height: BUTTON_HEIGHT,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(BORDER_RADIUS),
        color: cWhite.withAlpha(100),
      ),
      child: IconButton(
        icon: Icon(
          isFavorite ? LineIcons.heart : LineIcons.heart_o,
          size: 18,
        ),
        color: isFavorite ? Colors.red : Colors.black,
        onPressed: () {
          _onFavorite();
        },
      ),
    );
  }
}
