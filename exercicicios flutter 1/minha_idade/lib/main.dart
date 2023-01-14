import 'package:flutter/material.dart';
import 'package:minha_idade/minhaIdade.dart';
import 'package:minha_idade/strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red.shade700,
        title: const Text(
          Strings.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        centerTitle: true,
      ),
      body: const MinhaIdade(),
      ),
    );
  }
}
