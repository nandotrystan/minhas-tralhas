import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: TemaCoffee.light,
      darkTheme: TemaCoffee.dark,
      themeMode: ThemeMode.light,
      home: const MyAppBar(),
    );
  }
}

class MyAppBar extends StatefulWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(

          leading: const Icon(Icons.coffee, color: Colors.brown, size: 32.0,),
          title: const Text('Coffee', style: TextStyle(color: Colors.brown, fontSize: 32.0),),
          

          ),
    );
  }
}

class TemaCoffee {
  static final ThemeData light =
      ThemeData(brightness: Brightness.light, primarySwatch: Colors.yellow);

  static final ThemeData dark =
      ThemeData(brightness: Brightness.dark, primarySwatch: Colors.yellow);
}
