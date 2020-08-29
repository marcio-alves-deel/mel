import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:mel/core/constants/colors.dart';
import 'package:sailor/sailor.dart';

class PetViewPhotos extends StatefulWidget {
  @override
  _PetViewPhotosState createState() => _PetViewPhotosState();
}

class _PetViewPhotosState extends State<PetViewPhotos> {
  PageController _pageController = PageController();
  double currentPage = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final url = Sailor.param<String>(context, 'url');
    final id = Sailor.param<int>(context, 'id');

    return ClipPath(
      clipper: HeaderClipper(),
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                color: cDarkAccent,
              ),
              child: Hero(
                tag: 'pet_thumb_$id',
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white,
                        Colors.white,
                        Colors.black,
                      ],
                      tileMode: TileMode.clamp,
                    ).createShader(bounds);
                  },
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: PageView(
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      children: [
                        ClipRRect(
                          clipBehavior: Clip.antiAlias,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                          child: Image.network(
                            url,
                            fit: BoxFit.cover,
                          ),
                        ),
                        ClipRRect(
                          clipBehavior: Clip.antiAlias,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                          child: Image.network(
                            url,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 70,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new PageIndicator(
                    layout: PageIndicatorLayout.WARM,
                    size: 9.0,
                    controller: _pageController,
                    space: 5.0,
                    count: 4,
                    color: Colors.white,
                    activeColor: cPinkDark,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double holeRadius = 55;
    final double right = size.width / 2;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width - right + holeRadius, size.height)
      ..arcToPoint(
        Offset(size.width - right - holeRadius, size.height),
        clockwise: false,
        radius: Radius.circular(1),
      );

    path.lineTo(0.0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
