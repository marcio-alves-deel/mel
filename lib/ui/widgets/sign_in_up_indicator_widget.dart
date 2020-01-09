import 'dart:math' show max;

import 'package:flutter/cupertino.dart'
    show
        AnimatedWidget,
        Border,
        BorderSide,
        BoxDecoration,
        BuildContext,
        Color,
        Container,
        Curves,
        EdgeInsets,
        FontWeight,
        GestureDetector,
        MainAxisAlignment,
        PageController,
        Row,
        SizedBox,
        Text,
        TextStyle,
        ValueChanged,
        Widget;
import 'package:flutter/material.dart' show Colors;

class SignInUpIndicator extends AnimatedWidget {
  SignInUpIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.white,
  }) : super(listenable: controller);

  final PageController controller;
  final int itemCount;
  final ValueChanged<int> onPageSelected;
  final Color color;

  Widget _buildIndicator(int index) {
    final selected = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );

    final boxDecoration = BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: selected > 0 ? Colors.black : Colors.transparent,
          width: 1,
        ),
      ),
    );

    return new GestureDetector(
      onTap: () {
        onPageSelected(index);
      },
      child: Container(
        padding: EdgeInsets.only(
          bottom: 12,
        ),
        decoration: boxDecoration,
        child: _indicatorText(index, selected > 0),
      ),
    );
  }

  Widget _indicatorText(int index, bool selected) {
    final textStyle = new TextStyle(
        color: Colors.black,
        fontWeight: selected ? FontWeight.w900 : FontWeight.normal);

    if (index == 0)
      return Row(
        children: <Widget>[
          new Text('Sign in', style: textStyle),
        ],
      );
    else
      return new Text('Sign up', style: textStyle);
  }

  Widget build(BuildContext context) {
    return new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildIndicator(0),
          SizedBox(
            width: 25,
          ),
          _buildIndicator(1),
        ]);
  }
}
