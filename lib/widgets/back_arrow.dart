import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mel/core.dart'
    show Routes, cDarkAccent, cLightAccent, cPinkLight;

class BackArrow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 15,
      left: 18,
      child: SafeArea(
        child: svgButton(
            icon: 'assets/icons/arrows.svg',
            onPressed: () {
              Routes.sailor.pop();
            }),
      ),
    );
  }

  svgButton({onPressed, icon}) {
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
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              icon,
              color: cLightAccent,
            ),
          ),
        ),
        onTap: onPressed,
      ),
    );
  }
}
