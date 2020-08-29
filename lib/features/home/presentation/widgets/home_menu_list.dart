import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mel/core.dart' show cPinkLight;
import 'package:mel/core/constants/colors.dart';
import 'package:mel/features/authentication.dart';
import 'package:mel/widgets.dart' show TextSSerif;

class MenuList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            listItem(
              icon: svgIcon('assets/icons/child.svg'),
              label: 'Profile',
              onTap: () {},
            ),
            listItem(
              icon: svgIcon('assets/icons/paw.svg'),
              label: 'Favorites',
              onTap: () {},
            ),
            listItem(
              icon: svgIcon('assets/icons/content.svg'),
              label: 'My Content',
              onTap: () {},
            ),
            listItem(
              icon: svgIcon('assets/icons/cog-2.svg'),
              label: 'Settings',
              onTap: () {},
            ),
            Divider(
              color: cPinkLight,
            ),
            listItem(
              icon: svgIcon('assets/icons/support.svg'),
              label: 'Help & Support',
              onTap: () {},
            ),
            listItem(
              icon: svgIcon('assets/icons/info-3.svg'),
              label: 'About',
              onTap: () {},
            ),
            listItem(
              icon: svgIcon('assets/icons/logout.svg'),
              label: 'Sign out',
              onTap: () {
                final act = CupertinoActionSheet(
                    title: Text(
                      'Are you sure you want to sign out?',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    actions: <Widget>[
                      CupertinoActionSheetAction(
                        child: Text(
                          'Sign out',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          dispatchSignOut(context);
                        },
                      )
                    ],
                    cancelButton: CupertinoActionSheetAction(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ));
                showCupertinoModalPopup(
                    context: context, builder: (BuildContext context) => act);
              },
            ),
          ],
        ),
      ),
    );
  }

  final TextStyle menuStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: cPinkLight,
  );

  ListTile listItem({String label, icon, onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          icon,
          SizedBox(
            width: 10,
          ),
          TextSSerif(
            label,
            textStyle: menuStyle,
          ),
        ],
      ),
      onTap: onTap,
    );
  }

  void dispatchSignOut(context) {
    BlocProvider.of<AuthenticationBloc>(context).add(
      AuthenticationLoggedOut(),
    );
  }

  svgIcon(icon) {
    return SvgPicture.asset(
      icon,
      width: 18,
      height: 18,
      color: Colors.white,
    );
  }
}
