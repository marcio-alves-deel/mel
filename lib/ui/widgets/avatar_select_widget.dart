import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart' show ImagePicker, ImageSource;
import 'package:line_icons/line_icons.dart';
import 'package:mel/widgets.dart' show Button;

class AvatarSelectWidget extends StatefulWidget {
  File image;
  AvatarSelectWidget({
    this.image,
  });

  @override
  _AvatarSelectWidgetState createState() => _AvatarSelectWidgetState();
}

class _AvatarSelectWidgetState extends State<AvatarSelectWidget> {
  final COLOR_THEME = Color(0xffE27BCE);

  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        Container(
          child: _showImage(),
        ),
        _floatButton()
      ],
    );
  }

  void _pickImage() async {
    ImageSource imageSource;
    if (widget.image != null)
      return setState(() => widget.image = null);
    else
      imageSource = await showDialog<ImageSource>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Let's take a picture?"),
          content: Text(
              'You can take a photo from your camera or select from your gallery'),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                MaterialButton(
                  child: Text("Camera"),
                  onPressed: () => Navigator.pop(context, ImageSource.camera),
                ),
                MaterialButton(
                  child: Text("Gallery"),
                  onPressed: () => Navigator.pop(context, ImageSource.gallery),
                ),
              ],
            ),
            SizedBox(
              width: 30,
            ),
            MaterialButton(
              child: Icon(
                LineIcons.close,
                size: 14,
              ),
              onPressed: () => Navigator.pop(context, null),
            )
          ],
        ),
      );
    if (imageSource != null) {
      final file = await ImagePicker.pickImage(source: imageSource);
      if (file != null) {
        setState(() => widget.image = file);
      }
    }
  }

  Widget _showImage() {
    return Stack(
      children: <Widget>[
        Container(
          width: 170.0,
          height: 170.0,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: COLOR_THEME.withAlpha(70),
            ),
          ),
          child: _imageArea(),
        ),
      ],
    );
  }

  Widget _imageArea() {
    if (widget.image != null) {
      return Center(
        child: Container(
          width: 150.0,
          height: 150.0,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: FileImage(widget.image),
            ),
          ),
        ),
      );
    } else
      return Center(
        child: Container(
          width: 150.0,
          height: 150.0,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: COLOR_THEME,
          ),
          child: Icon(
            LineIcons.user,
            size: 60,
            color: Colors.white,
          ),
        ),
      );
  }

  Widget _floatButton() {
    return Positioned(
      bottom: 5,
      right: 5,
      child: Container(
        width: 45.0,
        height: 45.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Center(
          child: Container(
            width: 35.0,
            height: 35.0,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              color: COLOR_THEME,
            ),
            child: IconButton(
              icon: Icon(
                widget.image != null ? LineIcons.trash : LineIcons.camera_retro,
                size: 18,
                color: Colors.white,
              ),
              onPressed: _pickImage,
            ),
          ),
        ),
      ),
    );
  }
}
