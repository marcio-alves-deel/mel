import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mel/ui.dart' show FindPetHeader, PageGreetings, SelectType;

class FindPetTab extends StatefulWidget {
  @override
  _FindPetTabState createState() => _FindPetTabState();
}

class _FindPetTabState extends State<FindPetTab> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: SafeArea(
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 15,
              ),
              child: FindPetHeader(),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              child: PageGreetings(),
            ),
            SizedBox(
              height: 10,
            ),
            SelectType(),
            // Flexible(
            //   child: PetList(),
            // ),
          ]),
        ),
      ),
    );
  }
}
