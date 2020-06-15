import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mel/core.dart';

class SelectType extends StatefulWidget {
  @override
  _SelectTypeState createState() => _SelectTypeState();
}

class _SelectTypeState extends State<SelectType> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Text(
                  'Adopt',
                  style: TextStyle(
                    fontWeight: !isSwitched ? FontWeight.bold : FontWeight.w200,
                    fontSize: 14,
                  ),
                ),
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  activeTrackColor: cPinkDark,
                  inactiveTrackColor: cPinkDark,
                  activeColor: cWhite,
                ),
                Text(
                  'Find',
                  style: TextStyle(
                    fontWeight: isSwitched ? FontWeight.bold : FontWeight.w200,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(LineIcons.filter),
            iconSize: 18,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
