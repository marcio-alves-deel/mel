import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class MessageCardItem extends StatefulWidget {
  @override
  _MessageCardItemState createState() => _MessageCardItemState();
}

class _MessageCardItemState extends State<MessageCardItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/chat');
      },
      child: Container(
        width: double.infinity,
        height: 75,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _avatar(),
            SizedBox(
              width: 15,
            ),
            _content(),
          ],
        ),
      ),
    );
  }

  Widget _avatar() {
    return Container(
      child: Container(
        width: 50.0,
        height: 50.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
            fit: BoxFit.fill,
            image: new NetworkImage(
                "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80"),
          ),
        ),
      ),
    );
  }

  Widget _content() {
    return Expanded(
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1.0,
              color: Colors.black.withAlpha(10),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Jhon Doe',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'this is a message text',
                      style: TextStyle(color: Colors.black.withAlpha(200)),
                    ),
                    Text(
                      ' • 12 min',
                      style: TextStyle(color: Colors.black.withAlpha(900)),
                    ),
                  ],
                ),
              ],
            ),
            _newMessagesCounter()
          ],
        ),
      ),
    );
  }

  Widget _newMessagesCounter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: Color(0xffF4985F),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Text(
            '12',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
