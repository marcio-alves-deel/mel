import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mel/core/constants/colors.dart';
import 'package:mel/data.dart';
import 'package:mel/dependencies.dart';
import 'package:mel/features/messages.dart';
import 'package:mel/widgets.dart';

class MessagesScreen extends StatefulWidget {
  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<MessagesBloc>(
        create: (_) => di<MessagesBloc>()
          ..add(
            MessagesStarted(),
          ),
        child: buildBody(context),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              PageTitle('Messages'),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 20.0,
                ),
                child: searchBar(),
              ),
            ],
          ),
          Positioned.fill(
            top: 180,
            bottom: 80,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: BlocBuilder<MessagesBloc, MessagesState>(
                    builder: (context, state) {
                  if (state is! MessagesSuccess) return Container();
                  final List<User> messageList = (state.props[0]);
                  print(messageList);
                  return ListView.builder(
                    itemCount: messageList.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      if (index == 0) return newMessage(messageList[index]);
                      if (index % 2 == 0)
                        return Column(
                          children: [
                            Divider(),
                            newMessage(messageList[index]),
                          ],
                        );
                      return Column(
                        children: [
                          Divider(),
                          message(messageList[index]),
                        ],
                      );
                    },
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget searchBar() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: cPinkLight,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      height: 1.6,
                    ),
                    decoration: new InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                        left: 15,
                        bottom: 11,
                        top: 11,
                        right: 15,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SvgPicture.asset(
                          'assets/icons/search.svg',
                          width: 12,
                          height: 12,
                        ),
                      ),
                      hintText: 'Search',
                      fillColor: cDarkAccent,
                    ),
                  ),
                ),
                svgButton(icon: 'assets/icons/close-2.svg'),
              ],
            ),
          ),
        ),
      ],
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
              color: cDarkAccent.withOpacity(.7),
            ),
          ),
        ),
        onTap: onPressed,
      ),
    );
  }
}

Widget newMessage(User user) {
  return new Row(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: cDarkAccent,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(user.picture.url),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      SizedBox(
        width: 15,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextSSerif(
              user.userName,
              textStyle: TextStyle(
                color: cDarkAccent,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextSSerif(
              'Have you seen it?',
              textStyle: TextStyle(
                color: cDarkAccent.withOpacity(.7),
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
      Container(
        width: 20,
        height: 20,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: cDarkAccent,
          shape: BoxShape.circle,
        ),
        child: TextSSerif(
          '2',
          textStyle: TextStyle(
            color: cLightAccent,
            fontSize: 10,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    ],
  );
}

Widget message(User user) {
  return new Row(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: cDarkAccent,
            shape: BoxShape.circle,
          ),
        ),
      ),
      SizedBox(
        width: 15,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextSSerif(
              'Jhon Dow',
              textStyle: TextStyle(
                color: cDarkAccent,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextSSerif(
              'Have you seen it?',
              textStyle: TextStyle(
                color: cDarkAccent,
                fontSize: 12,
                fontWeight: FontWeight.w200,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
