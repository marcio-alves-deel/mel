import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mel/core/constants/colors.dart';
import 'package:mel/data.dart';
import 'package:mel/widgets.dart';

class ChatSenderBubble extends StatelessWidget {
  final Message message;

  const ChatSenderBubble(this.message, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: cLightAccent,
          ),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                TextSSerif(message.content),
                TextSSerif(
                  DateFormat('dd/MM – kk:mm').format(message.createdAt),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
