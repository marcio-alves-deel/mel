import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:mel/core.dart';
import 'package:mel/features/feed.dart'
    show FeedCarousel, FeedCategories, FeedGreetings, FeedItemDescription;

class FeedScreen extends StatefulWidget {
  final ZoomDrawerController controller;
  const FeedScreen({Key key, @required this.controller}) : super(key: key);
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  int pageIndex = 0;

  setPageIndex(page) {
    setState(() {
      pageIndex = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageHeight = MediaQuery.of(context).size.height * 0.3;
    final padding = MediaQuery.of(context).size.height * 0.03;
    return SafeArea(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              top: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                svgButton(
                  icon: 'assets/icons/menu.svg',
                  onPressed: () {
                    widget.controller.toggle();
                  },
                ),
                svgButton(
                  icon: 'assets/icons/filter.svg',
                  onPressed: () {
                    widget.controller.toggle();
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 20.0,
            ),
            child: FeedGreetings(),
          ),
          Container(
            height: 110,
            child: FeedCategories(),
          ),
          SizedBox(
            height: padding,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              height: pageHeight,
              child: FeedCarousel(
                  pageIndex: pageIndex, setPageIndex: setPageIndex),
            ),
          ),
          AnimatedSwitcher(
            child: FeedItemDescription(key: ValueKey(pageIndex)),
            duration: Duration(milliseconds: 200),
            // transitionBuilder: (Widget child, Animation<double> animation) {
            //   return ScaleTransition(
            //     scale: animation,
            //     child: child,
            //   );
            // },
          )
        ],
      ),
    );
  }

  svgButton({onPressed, icon}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: cPinkLight,
        customBorder: CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              icon,
              color: cDarkAccent,
            ),
          ),
        ),
        onTap: onPressed,
      ),
    );
  }
}
