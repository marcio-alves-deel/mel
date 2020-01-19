import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget PetSizeOptions({bool isSelected, onTap, String text}) {
  return InkWell(
    onTap: () {
      onTap(text);
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? Color(0xffE27BCE) : Colors.black,
        ),
      ),
    ),
  );
}
