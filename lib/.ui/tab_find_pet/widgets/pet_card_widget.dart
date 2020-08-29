import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

const double PET_CARD_WIDTH = 250.0;

class PetCardItem extends StatefulWidget {
  final String image;

  PetCardItem({this.image});

  @override
  _PetCardItemState createState() => _PetCardItemState();
}

class _PetCardItemState extends State<PetCardItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: _body(),
    );
  }

  Widget _body() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      height: double.infinity,
      width: PET_CARD_WIDTH,
      child: Stack(
        children: <Widget>[
          PetThumb(image: widget.image),
          Positioned(
            bottom: 15,
            left: 15,
            child: PetCardDescription(),
          ),
          Positioned(
            right: 15,
            top: 15,
            child: PetFavorite(),
          )
        ],
      ),
    );
  }
}
