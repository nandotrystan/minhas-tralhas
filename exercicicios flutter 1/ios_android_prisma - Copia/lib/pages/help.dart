import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PageHelp extends StatelessWidget {
  const PageHelp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 96.0, top: 240),
          child: Image.asset('assets/imagens/image1.png'),
        ),
      ],
    );
  }
}