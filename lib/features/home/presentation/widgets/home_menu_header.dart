import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;
import 'package:mel/core/constants/colors.dart';
import 'package:mel/data.dart' show User;
import 'package:mel/features/home.dart'
    show HomeBloc, HomeState, HomeSuccess, MenuAvatar;
import 'package:mel/widgets.dart' show TextSSerif;

class MenuHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is HomeSuccess) {
        final User user = (state.props[0] as User);
        return Column(
          children: <Widget>[
            MenuAvatar(),
            SizedBox(
              height: 15,
            ),
            TextSSerif(
              getFullName(
                user,
              ),
              textStyle: TextStyle(
                color: cWhite,
                fontSize: 22.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            TextSSerif(
              user.email,
              textStyle: TextStyle(
                color: cWhite,
                fontSize: 14.0,
                fontWeight: FontWeight.w200,
              ),
            )
          ],
        );
      }
      return Container();
    });
  }

  String getFullName(user) {
    return '${user.firstName} ${user.lastName}';
  }
}
