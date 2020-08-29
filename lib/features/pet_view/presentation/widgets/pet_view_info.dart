import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mel/widgets.dart' show TextSSerif;

class PetViewInfo extends StatelessWidget {
  final String icon;
  final String label;
  final String value;

  const PetViewInfo({Key key, this.icon, this.label, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 25,
          height: 25,
          child: SvgPicture.asset(icon),
        ),
        TextSSerif(
          label,
          textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextSSerif(
          value,
          textStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w200,
          ),
        ),
      ],
    );
  }
}
