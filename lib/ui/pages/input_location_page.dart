import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mel/widgets.dart'
    show Button, CutomBackButton, InputField, LocationInput;

class LocationPage extends StatefulWidget {
  @override
  State createState() => new LocationPageState();
}

class LocationPageState extends State<LocationPage> {
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
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            _header(),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: bottom + 100,
                          ),
                          child: _locationForm(),
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
    return new RichText(
      text: TextSpan(
        text: 'Location',
        style: GoogleFonts.quicksand(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 40,
        ),
      ),
    );
  }

  Widget _subtitle() {
    return Container(
      width: 250,
      child: new Text(
        'We will use your location to improve the filters displaying content based on distance from you',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _locationForm() {
    return Column(
      children: <Widget>[
        LocationInput(),
      ],
    );
  }
}
