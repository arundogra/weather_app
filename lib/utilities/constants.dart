import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 32.0,
  color: Colors.blueGrey,
);

const kButtonTextStyle = TextStyle(
  fontSize: 20.0,
  color: Colors.red,
  // fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextFieldInputDecoration = InputDecoration(
  fillColor: Colors.white,
  icon: Icon(Icons.location_city,color: Colors.blueGrey,size: 36,),
  hintText:  'Enter city name',
  hintStyle: TextStyle(color: Colors.blueGrey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide.none,
  ),
  filled: true,
);