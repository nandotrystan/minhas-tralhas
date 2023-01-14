import 'package:flutter/material.dart';
import 'package:wonderful_cities/resources/strings.dart';
import 'package:wonderful_cities/resources/theme.dart';
import 'package:wonderful_cities/wonderful_cities.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode currentThemeMode = ThemeMode.light;

  void toggleThemeMode() {
    setState(() {
      currentThemeMode = currentThemeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      themeMode: currentThemeMode,
      theme: WonderfulCitiesTheme.light,
      darkTheme: WonderfulCitiesTheme.dark,
      home: WonderfulCities(onThemeModePressed: toggleThemeMode),
    );
  }
}

