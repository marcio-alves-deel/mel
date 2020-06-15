import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mel/ui.dart' show FindPetTab, MessagesTab;
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
    MessagesTab(),
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
        body: Stack(
          children: <Widget>[
            _widgetOptions.elementAt(_selectedIndex),
            Align(
              alignment: Alignment.bottomCenter,
              child: Theme(
                data:
                    Theme.of(context).copyWith(canvasColor: Colors.transparent),
                child: _bottomBar(),
              ),
            ),
          ],
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
        _bottomNavBarItem(
          Icon(LineIcons.home),
          'Feed',
          // Color(0xff000000),
          Color(0xffE27BCE),
        ),
        _bottomNavBarItem(
          Icon(LineIcons.comment),
          'Chat',
          // Color(0xff000000),
          Color(0xffF4985F),
        ),
        _bottomNavBarItem(
          Icon(LineIcons.plus),
          'New',
          // Color(0xff000000),
          Color(0xff3CB371),
        ),
        _bottomNavBarItem(
          Icon(LineIcons.bell),
          'Alerts',
          Color(0xff5FD2F4),
          // Color(0xff000000),
        ),
      ],
    );
  }

  BottomNavBarItem _bottomNavBarItem(Icon icon, String text, Color color) {
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
}
