import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mel/controllers.dart';
import 'package:mel/core.dart';
import 'package:mel/dependencies.dart';
import 'package:mel/models.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  AuthController controller = Get.put(di<AuthController>());

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Row(
              children: <Widget>[
                Icon(CupertinoIcons.left_chevron),
              ],
            ),
          ),
          middle: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              MessageThumb(),
            ],
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                cPinkLight,
                cOrange,
              ],
            ),
          ),
          child: Container(),
        ),
      ),
    );
  }
}

class MessageThumb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<AuthController>(
      builder: (_) {
        print(_.getState);

        return Text('');
      },
    );
    // return Obx(
    //   () => Container(
    //     child: Container(
    //       width: 35.0,
    //       height: 35.0,
    //       decoration: new BoxDecoration(
    //         shape: BoxShape.circle,
    //         image: new DecorationImage(
    //           fit: BoxFit.fill,
    //           image: new NetworkImage(controller.getCurrent.picture.url),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
