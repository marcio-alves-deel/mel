import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mel/core/constants/colors.dart';
import 'package:mel/data.dart';
import 'package:mel/widgets.dart';

class ChatReceiverBubble extends StatelessWidget {
  final Message message;

  const ChatReceiverBubble(this.message, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: cPinkLight,
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
