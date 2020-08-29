import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;

class TextSerif extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final TextStyle textStyle;

  const TextSerif(this.text, {Key key, this.textAlign, this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.cormorant(
        textStyle: textStyle,
      ),
    );
  }
}
