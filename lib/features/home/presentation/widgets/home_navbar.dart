import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mel/core/constants/colors.dart';
import 'package:mel/widgets.dart' show BottomNavBar, BottomNavBarItem;

class HomeNavbar extends StatelessWidget {
  final int selectedIndex;
  final onItemTapped;

  const HomeNavbar(
      {Key key, @required this.selectedIndex, @required this.onItemTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavBar(
      selectedIndex: selectedIndex,
      itemCornerRadius: 30,
      curve: Curves.easeInBack,
      onItemSelected: onItemTapped,
      iconSize: 16,
      items: [
        _bottomNavBarItem(
          'assets/icons/animal.svg',
          'Pets',
          cDarkAccent,
        ),
        _bottomNavBarItem(
          'assets/icons/text-message.svg',
          // Icon(LineIcons.comment),
          'Messages',
          cDarkAccent,
        ),
        _bottomNavBarItem(
          'assets/icons/plus.svg',
          // Icon(LineIcons.plus),
          'Add Pet',
          cDarkAccent,
        ),
        _bottomNavBarItem(
          'assets/icons/bell.svg',
          // Icon(LineIcons.bell),
          'Notifications',
          cDarkAccent,
        ),
      ],
    );
  }

  BottomNavBarItem _bottomNavBarItem(String icon, String text, Color color) {
    return BottomNavBarItem(
      icon: icon,
      title: Text(
        text,
        style: TextStyle(
          fontSize: 12,
        ),
      ),
      activeColor: color,
      textAlign: TextAlign.center,
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
