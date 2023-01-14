import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyStateFul());
}

class MyStateFul extends StatefulWidget {
  const MyStateFul({Key? key}) : super(key: key);

  @override
  _MyStateFulState createState() => _MyStateFulState();
}

class _MyStateFulState extends State<MyStateFul> {
  int cooper = 0;
  int silver = 0;
  int gold = 0;

  void somarMoedas() {
    setState(() {
      cooper++;
      if (cooper >= 10) {
        silver++;
        cooper = 0;
        if (silver >= 10) {
          gold++;
          silver = 0;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GestureDetector( 
        onTap: somarMoedas,
        child: Text(
          'Cooper: $cooper\nSilver: $silver\n Gold: $gold',
          textDirection: TextDirection.ltr, 
          textAlign: TextAlign.center,
          style: const TextStyle(decoration: TextDecoration.none,
          color: Colors.lightBlueAccent,
          ),
          
        
        ),
      ),
    );
  }
}
