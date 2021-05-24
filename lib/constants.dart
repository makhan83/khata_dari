import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);


const kLabelTextStyle = TextStyle(
    fontSize: 18.0,color: Color(0xFF8D8E98)
);

const kLabelStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

const kBottomContainerHeight = 80.0;
const kActiveCardColour = Color(0XFF1D1E33);
const kBottomContainerColour = Color(0xFFEB1555);
const kInactiveCardColour = Color(0xFF111328);
