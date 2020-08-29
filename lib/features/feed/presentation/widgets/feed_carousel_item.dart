import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mel/core.dart' show Routes;
import 'package:sailor/sailor.dart';

const SCALE_FRACTION = 0.9;

const AVATAR_WIDTH = 30.0;
const AVATAR_HEIGHT = 30.0;

class FeedCarouselItem extends StatelessWidget {
  final int index;
  final double page;
  final String item;

  const FeedCarouselItem({Key key, this.index, this.page, this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageHeight = MediaQuery.of(context).size.height * 0.23;
    final double viewPortFraction = 0.3;
    final scale = max(SCALE_FRACTION,
        (SCALE_FRACTION - (index - page).abs()) + viewPortFraction);

    return Align(
      alignment: Alignment.center,
      child: Transform.scale(
        scale: scale,
        child: GestureDetector(
          onTap: () {
            Routes.sailor(
              '/pet_view',
              params: {
                'url': item,
                'id': index,
              },
              transitions: [
                SailorTransition.fade_in,
              ],
            );
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 10),
            height: pageHeight,
            width: pageHeight,
            child: Hero(
              tag: 'pet_thumb_$index',
              child: Card(
                elevation: 0,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35.0),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        item,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
