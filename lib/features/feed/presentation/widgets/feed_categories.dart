import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mel/core/constants/colors.dart';
import 'package:mel/widgets.dart' show TextSSerif;

const HORIZONTAL_PADDING = 10.0;

class FeedCategories extends StatefulWidget {
  @override
  _FeedCategoriesState createState() => _FeedCategoriesState();
}

class _FeedCategoriesState extends State<FeedCategories> {
  @override
  Widget build(BuildContext context) {
    final containerSize = MediaQuery.of(context).size.height * 0.06;
    return Row(
      // scrollDirection: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            right: HORIZONTAL_PADDING,
          ),
          child: categoryItem(
            containerSize,
            title: 'Adopt',
            icon: 'assets/icons/adoption.svg',
            onTap: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: HORIZONTAL_PADDING,
          ),
          child: categoryItem(
            containerSize,
            title: 'Needing Attention',
            icon: 'assets/icons/pets.svg',
            onTap: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: HORIZONTAL_PADDING,
          ),
          child: categoryItem(
            containerSize,
            title: 'Lost Pets',
            icon: 'assets/icons/poster.svg',
            onTap: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: HORIZONTAL_PADDING,
          ),
          child: categoryItem(
            containerSize,
            title: 'Pet Sitter',
            icon: 'assets/icons/dog.svg',
            onTap: () {},
          ),
        ),
      ],
    );
  }

  categoryItem(containerSize, {String title, onTap, icon}) {
    return Column(
      children: <Widget>[
        Container(
          width: containerSize,
          height: containerSize,
          decoration: BoxDecoration(
            color: cPinkLight,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: SvgPicture.asset(
              icon,
              color: cDarkAccent,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        InkWell(
          child: Container(
            alignment: Alignment.center,
            width: containerSize,
            child: TextSSerif(
              title,
              textStyle: TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
