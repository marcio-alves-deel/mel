import 'package:flutter/cupertino.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mel/widgets.dart';

class Filters extends StatefulWidget {
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  String _petSize = 'Small';
  String open;

  @override
  void initState() {
    setState(() {
      open = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Column(
          children: <Widget>[
            FilterItem(
              text: 'Size',
              icon: LineIcons.expand,
              bottom: 35,
              openState: open == 'Size',
              onTap: _toggleOpen,
              content: Row(
                children: <Widget>[
                  PetSizeOptions(
                      text: 'Small',
                      onTap: _selectPetSize,
                      isSelected: _petSize == 'Small'),
                  PetSizeOptions(
                      text: 'Medium',
                      onTap: _selectPetSize,
                      isSelected: _petSize == 'Medium'),
                  PetSizeOptions(
                      text: 'Big',
                      onTap: _selectPetSize,
                      isSelected: _petSize == 'Big')
                ],
              ),
            ),
            FilterItem(
              text: 'Distance',
              icon: LineIcons.car,
              bottom: 25,
              openState: open == 'Distance',
              onTap: _toggleOpen,
            ),
            FilterItem(
              text: 'Location',
              icon: LineIcons.globe,
              bottom: 25,
              openState: open == 'Location',
              onTap: _toggleOpen,
            ),
            FilterItem(
              text: 'Age',
              icon: LineIcons.calendar,
              bottom: 25,
              openState: open == 'Age',
              onTap: _toggleOpen,
            ),
            FilterItem(
              text: 'Pet',
              icon: LineIcons.paw,
              bottom: 25,
              openState: open == 'Pet',
              onTap: _toggleOpen,
            ),
            FilterItem(
              text: 'Gender',
              icon: LineIcons.genderless,
              bottom: 25,
              openState: open == 'Gender',
              onTap: _toggleOpen,
            ),
          ],
        ),
      ],
    );
  }

  void _selectPetSize(String value) {
    setState(
      () {
        _petSize = value;
      },
    );
  }

  void _toggleOpen(String toOpen) {
    print(toOpen);
    if (open == toOpen)
      setState(() {
        open = null;
      });
    else
      setState(() {
        open = toOpen;
      });
  }
}
