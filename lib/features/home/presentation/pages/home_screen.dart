import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocListener, BlocProvider;
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:mel/core.dart' show cPinkDark, cPinkDarker, cPinkLight, cWhite;
import 'package:mel/dependencies.dart' show di;
import 'package:mel/features/feed.dart' show FeedScreen;
import 'package:mel/features/home.dart'
    show HomeBloc, HomeFailure, HomeNavbar, HomeStarted, HomeState;
import 'package:mel/features/messages.dart' show MessagesScreen;
import 'package:mel/widgets.dart' show toastNotify;

import 'menu_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _drawerController = ZoomDrawerController();
  final _pageViewController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<HomeBloc>(
        create: (_) => di<HomeBloc>()
          ..add(
            HomeStarted(),
          ),
        child: buildBody(context),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeFailure) {
          toastNotify(
            state.props[0],
            context: context,
          );
        }
      },
      child: ZoomDrawer(
        controller: _drawerController,
        menuScreen: Stack(
          children: <Widget>[
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return RadialGradient(
                  center: Alignment.topRight,
                  radius: 2,
                  colors: <Color>[cPinkLight, cPinkLight, cPinkDarker],
                  tileMode: TileMode.clamp,
                ).createShader(bounds);
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [cPinkLight, cPinkDark],
                  ),
                ),
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            MenuScreen(_drawerController),
          ],
        ),
        mainScreen: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: <Widget>[
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      cPinkLight,
                      Colors.white,
                      Colors.white,
                    ],
                    tileMode: TileMode.clamp,
                  ).createShader(bounds);
                },
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: cWhite,
                ),
              ),
              PageView(
                controller: _pageViewController,
                onPageChanged: (pos) {
                  setState(() {
                    _currentPage = pos;
                  });
                },
                children: [
                  FeedScreen(
                    controller: _drawerController,
                  ),
                  MessagesScreen(),
                  Container(),
                  Container(),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(canvasColor: Colors.transparent),
                  child: HomeNavbar(
                    onItemTapped: (pos) {
                      setState(() {
                        _currentPage = pos;
                      });
                      _pageViewController.animateToPage(
                        pos,
                        curve: Curves.easeIn,
                        duration: Duration(
                          milliseconds: 200,
                        ),
                      );
                    },
                    selectedIndex: _currentPage,
                  ),
                ),
              ),
            ],
          ),
        ),
        borderRadius: 24.0,
        showShadow: false,
        angle: 0.0,
        backgroundColor: Colors.grey[300],
        slideWidth: MediaQuery.of(context).size.width * .65,
        openCurve: Curves.easeOut,
        closeCurve: Curves.easeIn,
      ),
    );
  }
}
