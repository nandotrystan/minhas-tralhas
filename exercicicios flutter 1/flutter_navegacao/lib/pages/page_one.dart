import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  PageOne({Key? key,}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(child: const Text('Primeira Página', style: TextStyle(fontSize: 22, color: Colors.orange),)),
    );
  }
}
