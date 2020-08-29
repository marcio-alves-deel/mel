import 'package:flutter/material.dart';
import 'package:mel/core.dart' show cDarkAccent, cLightAccent, cPinkDark;
import 'package:mel/widgets.dart' show TextSSerif;

class PetViewAdoptButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        radius: 50,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: cDarkAccent,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: cPinkDark.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 9,
                ),
              ],
            ),
            alignment: Alignment.center,
            child: TextSSerif(
              'Take me home',
              textStyle: TextStyle(
                color: cLightAccent,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
