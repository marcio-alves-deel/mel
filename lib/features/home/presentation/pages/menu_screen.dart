import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:mel/features/home.dart' show MenuHeader, MenuList;

class MenuScreen extends StatelessWidget {
  final ZoomDrawerController controller;

  MenuScreen(this.controller);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: MediaQuery.of(context).size.width * .65,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 40.0,
              horizontal: 20.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                MenuHeader(),
                SizedBox(
                  height: 45.0,
                ),
                MenuList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
