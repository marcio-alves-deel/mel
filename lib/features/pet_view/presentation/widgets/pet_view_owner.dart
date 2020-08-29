import 'package:flutter/material.dart';
import 'package:mel/widgets.dart' show TextSSerif;

class PetViewOwner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
          TextSSerif(
            'Jhon Doe',
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSSerif(
            'Owner',
            textStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 13,
              color: Colors.black38,
            ),
          ),
        ],
      ),
    );
  }
}
