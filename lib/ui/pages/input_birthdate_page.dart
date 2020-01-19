import 'package:date_util/date_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mel/pages.dart';
import 'package:mel/widgets.dart'
    show Button, CutomBackButton, DropdownInput, DropdownInputState;

class InputBirthdatePage extends StatefulWidget {
  InputBirthdatePage({Key key}) : super(key: key);

  @override
  InputBirthdatePageState createState() => new InputBirthdatePageState();
}

class InputBirthdatePageState extends State<InputBirthdatePage> {
  final dateUtility = new DateUtil();
  final GlobalKey<DropdownInputState> _monthKey =
      new GlobalKey<DropdownInputState>();
  final List<String> _months = [
    'Jan.',
    'Feb',
    'Mar.',
    'Apr.',
    'Jun.',
    'Jul',
    'Aug.',
    'Sep.',
    'Oct.',
    'Nov.',
    'Dec.'
  ];

  final GlobalKey<DropdownInputState> _dayKey =
      new GlobalKey<DropdownInputState>();
  final List<int> _days = List<int>.generate(10, (i) => i + 1);

  final GlobalKey<DropdownInputState> _yearKey =
      new GlobalKey<DropdownInputState>();

  final COLOR_THEME = Color(0xffE27BCE);

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    return new Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: CutomBackButton(context: context),
      body: new GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: new Stack(
          children: <Widget>[
            Center(
              child: new SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            _header(context),
                          ],
                        ),
                        SizedBox(
                          height: 110,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: bottom,
                          ),
                          child: _inputBirthdate(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              right: 30,
              child: Button(
                color: COLOR_THEME,
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LocationPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _title(),
        SizedBox(
          height: 10,
        ),
        _subtitle(),
      ],
    );
  }

  Widget _title() {
    return new Text(
      'Birthdate',
      style: GoogleFonts.quicksand(
        color: Colors.black,
        fontSize: 40,
      ),
    );
    ;
  }

  Widget _subtitle() {
    return Container(
      width: 250,
      child: new Text(
        'We need to ensure that You are older than 13 years',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _inputBirthdate() {
    return Container(
      height: 100,
      child: Row(
        children: <Widget>[
          Expanded(
            child: DropdownInput(
              items: _getRange(
                  new DateTime.now().year - 120, new DateTime.now().year),
              key: _yearKey,
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Expanded(
            child: DropdownInput(
              items: _months,
              key: _monthKey,
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Expanded(
            child: DropdownInput(
              items: _getRange(1, 31),
              key: _dayKey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _note(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 60,
      child: new Text(
        'Note: Providing a real name will help other users to find and contact your.',
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 14,
          color: Colors.black45,
        ),
      ),
    );
  }

  List<String> _getRange(int start, int end) {
    List<String> range = [];

    for (var i = start; i <= end; i++) {
      range.add(i.toString());
    }

    return range;
  }
}
