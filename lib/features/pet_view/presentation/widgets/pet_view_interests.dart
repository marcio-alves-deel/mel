import 'package:flutter/material.dart';
import 'package:mel/core.dart' show cDarkAccent, cLightAccent;
import 'package:mel/widgets.dart' show TextSSerif;

class PetViewInterests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.translate(
          offset: Offset(30, 0),
          child: Row(
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: cDarkAccent,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: cLightAccent,
                      spreadRadius: 2,
                      blurRadius: 0,
                    ),
                  ],
                ),
              ),
              Transform.translate(
                offset: Offset(-20, 0),
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: cDarkAccent,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: cLightAccent,
                        spreadRadius: 2,
                        blurRadius: 0,
                      ),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(-40, 0),
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: cDarkAccent,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: cLightAccent,
                        spreadRadius: 2,
                        blurRadius: 0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 100,
          child: TextSSerif(
            'and 10 more interested.',
            textStyle: TextStyle(
              fontSize: 11,
              color: Colors.black38,
            ),
          ),
        ),
      ],
    );
  }
}
