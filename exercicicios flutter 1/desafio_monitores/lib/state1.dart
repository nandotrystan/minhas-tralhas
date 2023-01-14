import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  Circle({Key? key, required this.change}) : super(key: key);
  VoidCallback change;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.end,

        children: [
          Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  change;
                },
                child: AnimatedContainer(
                  key: const ValueKey('key'),
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeInOut,
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20)),
                  transform: Matrix4.identity()..translate(0, 0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
