import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mel/pages.dart' show SignInPage;
import 'package:mel/widgets.dart' show SignInUpIndicator, SignInUpPageView;

class HomeLayout extends StatefulWidget {
  @override
  State createState() => new HomeLayoutState();
}

class HomeLayoutState extends State<HomeLayout> {
  final _controller = new PageController();

  final List<Widget> _pages = <Widget>[
    new Container(
      child: Center(
        child: SignInPage(),
      ),
    ),
    new Container(
      child: Center(
        child: Text('Page 2'),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: new Stack(
          children: <Widget>[
            new SignInUpPageView(controller: _controller, pages: _pages),
            _body()
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return new Positioned(
      right: 30.0,
      top: 10.0,
      child: new SafeArea(
        child: new Container(
          child: new Center(
            child: new SignInUpIndicator(
              controller: _controller,
              itemCount: _pages.length,
              onPageSelected: (int page) {
                _controller.animateToPage(
                  page,
                  curve: Curves.easeInOut,
                  duration: Duration(milliseconds: 300),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
