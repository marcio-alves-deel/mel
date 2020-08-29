import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mel/core.dart'
    show cDarkAccent, cLightAccent, cPinkDark, cPinkLight;

class PetViewFavoriteButton extends StatefulWidget {
  @override
  _PetViewFavoriteButtonState createState() => _PetViewFavoriteButtonState();
}

class _PetViewFavoriteButtonState extends State<PetViewFavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: cPinkLight,
        customBorder: CircleBorder(),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: cDarkAccent,
            boxShadow: [
              BoxShadow(
                color: cPinkDark.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 9,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(
              'assets/icons/heart_o.svg',
              color: cLightAccent,
            ),
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
