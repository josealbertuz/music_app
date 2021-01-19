import 'package:flutter/material.dart';

final primaryTheme = ThemeData(
  appBarTheme: appBarTheme,
  sliderTheme: sliderTheme,
  inputDecorationTheme: inputDecorationTheme
);

final appBarTheme = AppBarTheme(
    elevation: 0, color: Colors.transparent, textTheme: TextTheme());

final sliderTheme = SliderThemeData(
    activeTrackColor: Colors.white,
    inactiveTrackColor: Colors.white54,
    thumbColor: Colors.white,
    overlayColor: Colors.white24,
    trackHeight: 2,
    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5),
    showValueIndicator: ShowValueIndicator.onlyForContinuous,
    valueIndicatorColor: Colors.white,
    valueIndicatorTextStyle: TextStyle(color: Colors.black));

final inputDecorationTheme = InputDecorationTheme(
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
  contentPadding: EdgeInsets.all(20),
  filled: true,
  fillColor: Colors.white,
  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
  labelStyle: TextStyle(color: Colors.black),
);
