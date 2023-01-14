import 'package:flutter/material.dart';

class Retangle extends StatelessWidget {
  Retangle({Key? key, required this.change}) : super(key: key);
  VoidCallback change;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (() {
                  change;
                }),
                child: AnimatedContainer(
                  key: const ValueKey('key'),
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeInOut,
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20)),
                  transform: Matrix4.identity()..translate(300, 0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
