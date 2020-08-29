import 'package:flutter/material.dart';
import 'package:mel/core/constants/colors.dart';
import 'package:mel/widgets/text_s_serif_widget.dart';

class PageTitle extends StatelessWidget {
  final String title;

  const PageTitle(this.title, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 45,
          left: 30,
        ),
        child: Row(
          children: [
            TextSSerif(
              title,
              textStyle: TextStyle(
                color: cDarkAccent,
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
