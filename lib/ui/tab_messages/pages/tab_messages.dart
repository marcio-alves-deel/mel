import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mel/ui.dart' show Header;
import 'package:mel/widgets.dart';

class MessagesTab extends StatefulWidget {
  @override
  _MessagesTabState createState() => _MessagesTabState();
}

class _MessagesTabState extends State<MessagesTab> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Hero(
        tag: 'pageContainer',
        child: Container(
          width: double.infinity,
          color: Color(0xffffff),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: <Widget>[
                  Header(),
                  SizedBox(
                    height: 30,
                  ),
                  _messageList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _messageList() {
    return Expanded(
      child: ListView(
        children: <Widget>[
          MessageCardItem(),
          MessageCardItem(),
          MessageCardItem(),
        ],
      ),
    );
  }
}
