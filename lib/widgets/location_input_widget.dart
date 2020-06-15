import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';

class LocationInput extends StatefulWidget {
  LocationInput({
    this.language = 'en',
  });
  final String language;
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  TextEditingController _controller = TextEditingController();
  Future<PlacesAutocompleteResponse> _autocomplete;
  GoogleMapsPlaces places;

  final FocusNode _focusNode = FocusNode();

  OverlayEntry _overlayEntry;

  void onChange() {
    setState(() {
      _autocomplete = places.autocomplete(_controller.text);
    });
  }

  @override
  void initState() {
    places =
        GoogleMapsPlaces(apiKey: 'AIzaSyC-OHeGgrRHWqf3gkMWAKvd6yvJKpvv6xM');
    _autocomplete = places.autocomplete('');
    _focusNode.addListener(
      () {
        if (_focusNode.hasFocus) {
          this._overlayEntry = this._createOverlayEntry();
          Overlay.of(context).insert(this._overlayEntry);
        } else {
          this._overlayEntry.remove();
        }
      },
    );

    super.initState();
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject();
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);
    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        bottom: MediaQuery.of(context).viewInsets.bottom + 15,
        height: 100,
        width: size.width,
        child: Material(
          elevation: 4.0,
          child: FutureBuilder<PlacesAutocompleteResponse>(
            future: _autocomplete,
            builder: (BuildContext context,
                AsyncSnapshot<PlacesAutocompleteResponse> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                default:
                  final items = snapshot.data.predictions;
                  return ListView(
                    padding: EdgeInsets.zero,
                    children: items
                        .map(
                          (item) => ListTile(
                            title: Text(item.description),
                          ),
                        )
                        .toList(),
                  );
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      controller: _controller,
      onChanged: (text) {
        setState(() {
          print(text);
          _autocomplete = places.autocomplete(text);
        });
      },
    );
  }
}
