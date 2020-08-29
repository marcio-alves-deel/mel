import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalInfiniteScroll extends StatefulWidget {
  final List<Widget> listItems;
  final ScrollController controller;
  final double height;
  final double scrollOffset;

  HorizontalInfiniteScroll(
      {this.listItems, this.controller, this.height, this.scrollOffset});

  @override
  _HorizontalInfiniteScrollState createState() =>
      _HorizontalInfiniteScrollState();
}

class _HorizontalInfiniteScrollState extends State<HorizontalInfiniteScroll> {
  double scrollPosition = 0;
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        scrollPosition = widget.controller.position.pixels;
      });
    });
  }

  double _convertScale(input) => ((input - 0) / (750 - 0)) * (0.3 - 0) + 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: ListView.builder(
        shrinkWrap: true,
        controller: widget.controller,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          var offset = max(scrollPosition - (250 * index), 0.0);
          if (index < widget.listItems.length)
            return Transform.translate(
              offset: Offset(
                min(offset, widget.controller.position.maxScrollExtent),
                0,
              ),
              child: Transform.scale(
                scale: min(
                    1 - min(_convertScale((250 * index) - scrollPosition), 1),
                    1),
                child: widget.listItems[index],
              ),
            );
          // else
          //   return widget.listItems[index];
          else {
            return Container(
              width: 250,
              child: Center(
                child: new CircularProgressIndicator(),
              ),
            );
          }
        },
        itemCount: widget.listItems.length + 1,
      ),
    );
  }
}
