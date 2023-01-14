import 'package:flutter/material.dart';


class SportsGymTheme {
  static final ThemeData light = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.green,
      scaffoldBackgroundColor: Colors.grey[200],
      textTheme: _textTheme);

  static final ThemeData dark = ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.green,
      textTheme: _textTheme);

  static const _textTheme = TextTheme(
    bodyText2: TextStyle(fontSize: 20.0),
  );
}
