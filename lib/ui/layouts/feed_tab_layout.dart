import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mel/pages.dart';
import 'package:mel/widgets.dart';

class FeedTabLayout extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<FeedTabLayout> {
  final COLOR_THEME = Color(0xffE27BCE);
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    FindPetTab(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: _bottomBar(),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _bottomBar() {
    return BottomNavBar(
      selectedIndex: _selectedIndex,
      itemCornerRadius: 30,
      curve: Curves.easeInBack,
      onItemSelected: _onItemTapped,
      iconSize: 16,
      items: [
        BottomNavBarItem(
          icon: Icon(LineIcons.home),
          title: Text(
            'Feed',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          activeColor: Color(0xffE27BCE),
          textAlign: TextAlign.center,
        ),
        BottomNavBarItem(
          icon: Icon(LineIcons.comment),
          title: Text(
            'Chat',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          activeColor: Color(0xffF4985F),
          textAlign: TextAlign.center,
        ),
        BottomNavBarItem(
          icon: Icon(LineIcons.plus),
          title: Text(
            'Create',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          activeColor: Color(0xff3CB371),
          textAlign: TextAlign.center,
        ),
        BottomNavBarItem(
          icon: Icon(LineIcons.bell),
          title: Text(
            'Alerts',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          activeColor: Color(0xff5FD2F4),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
