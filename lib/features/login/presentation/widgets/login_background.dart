import 'package:flutter/material.dart';
import 'package:mel/core/constants/colors.dart';

class LoginBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return RadialGradient(
          center: Alignment.topRight,
          radius: 3,
          colors: <Color>[
            cPinkLight,
            cPinkLight,
            cPinkDark,
            Colors.grey,
            cBlack,
          ],
          tileMode: TileMode.clamp,
        ).createShader(bounds);
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            alignment: Alignment.centerLeft,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
