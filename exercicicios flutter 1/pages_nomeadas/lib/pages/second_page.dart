import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({Key? key, required this.msg}) : super(key: key);
  String msg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Text('Cidade'),
        centerTitle: true,
        ),
      body: Center(child: Text(msg, style: TextStyle(color: Colors.purpleAccent, fontSize: 32)),
    ));
  }
}
