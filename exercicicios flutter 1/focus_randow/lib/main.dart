import 'package:flutter/material.dart';
import 'package:focus_randow/foco.dart';
import 'package:focus_randow/inputs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  final focusInput = FocusInput();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: widget.focusInput.cor,
          title: Text(FocusInput.title, style: const TextStyle(fontSize: 32),),
          centerTitle: true,
        ),
        body: Foco(),
      ),
    );
  }
}
