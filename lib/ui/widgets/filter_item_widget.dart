import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:overlay_container/overlay_container.dart';

Widget FilterItem(
    {String text,
    IconData icon,
    Widget content,
    double bottom,
    bool openState,
    onTap}) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 200),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: () {
            onTap(text);
          },
          borderRadius: BorderRadius.circular(30),
          child: RotatedBox(
            quarterTurns: 3,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Column(
                children: <Widget>[
                  Icon(
                    icon,
                    color:
                        openState ? Colors.black : Colors.black.withAlpha(60),
                    size: 12,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      color:
                          openState ? Colors.black : Colors.black.withAlpha(60),
                      fontWeight: openState ? FontWeight.w700 : FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        OverlayContainer(
          show: openState,
          // Let's position this overlay to the right of the button.
          position: OverlayContainerPosition(
            20,
            // Bottom position.
            bottom ?? 0,
          ),
          // The content inside the overlay.
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey[200],
                  blurRadius: 5,
                  spreadRadius: 3,
                )
              ],
            ),
            child: content,
          ),
        ),
      ],
    ),
  );
}
