import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  PageTwo({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(child: const Text('Segunda Página', style: TextStyle(fontSize: 22, color: Colors.white),)),
    );
  }
}