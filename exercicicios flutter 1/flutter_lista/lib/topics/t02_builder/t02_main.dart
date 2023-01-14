import 'package:flutter/material.dart';
import 'package:flutter_lista/resources/strings.dart';
import 'package:flutter_lista/resources/theme.dart';


void main() => runApp(const PhoneBookApp());

class PhoneBookApp extends StatefulWidget {
  const PhoneBookApp({Key? key}) : super(key: key);

  @override
  State<PhoneBookApp> createState() => _PhoneBookAppState();
}

class _PhoneBookAppState extends State<PhoneBookApp> {
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
      theme: PhoneBookTheme.light,
      darkTheme: PhoneBookTheme.dark,
      home: Builder(
        builder: (context) {
          return Container(
            color: Theme.of(context).backgroundColor,
            alignment: Alignment.center,
            child: const Text('Teste'),
          );
        }
      ),
      // home: PhoneBook(onThemeModePressed: toggleThemeMode),
    );
  }
}
