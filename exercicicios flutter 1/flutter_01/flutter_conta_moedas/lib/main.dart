import 'package:flutter/material.dart';

void main() {
  runApp(const MyComponent());
}

class MyComponent extends StatelessWidget {
  const MyComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
          
            ),
          ),
          
          Align(
            alignment: Alignment.bottomLeft,
            child: Block(cor: Colors.blueGrey, 
              
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Block(cor: Colors.deepPurple, 
                   
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Block(cor: Colors.lightGreen, 
            
            ),
          ),
        ],
        ),
    );
  }
}

// ignore: must_be_immutable
class Block extends StatefulWidget {
  final Color cor;
  double altura;
  double largura;

  Block({Key? key, required this.cor, this.altura = 100, this.largura = 100})
      : super(key: key);

  @override
  State<Block> createState() => _BlockState();
}

class _BlockState extends State<Block> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.cor,
      height: widget.altura,
      width: widget.largura,
      
    );
  }
}
