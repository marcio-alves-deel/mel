import 'package:flutter/cupertino.dart'
    show
        BuildContext,
        NeverScrollableScrollPhysics,
        PageController,
        PageView,
        StatelessWidget,
        Widget;
import 'package:meta/meta.dart' show required;

class SignInUpPageView extends StatelessWidget {
  final PageController controller;
  final List<Widget> pages;
  SignInUpPageView({@required this.controller, @required this.pages});

  @override
  Widget build(BuildContext context) {
    return new PageView.builder(
      physics: new NeverScrollableScrollPhysics(),
      controller: controller,
      itemBuilder: (BuildContext context, int index) {
        return pages[index % pages.length];
      },
    );
  }
}
