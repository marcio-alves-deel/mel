import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownInput extends StatefulWidget {
  final List<String> items;

  DropdownInput({Key key, this.items}) : super(key: key);

  @override
  State createState() => new DropdownInputState();
}

class DropdownInputState extends State<DropdownInput> {
  String _current = '';
  List<DropdownMenuItem<String>> _dropdownValues;

  @override
  void initState() {
    _dropdownValues = getDropDownMenuItems();
    _current = _dropdownValues.length > 50
        ? _dropdownValues[_dropdownValues.length - 1].value
        : _dropdownValues[0].value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new DropdownButton(
      isExpanded: true,
      value: _current,
      items: _dropdownValues,
      onChanged: changedDropDownItem,
    );
  }

  void changedDropDownItem(String selected) {
    setState(() {
      _current = selected;
    });
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String item in widget.items) {
      items.add(
        new DropdownMenuItem(
          value: item,
          child: Container(
            width: 100,
            child: new Text(
              item,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      );
    }
    return items;
  }

  String get currentValue => _current;
}
