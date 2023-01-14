import 'dart:math';

import 'package:dado_magico/cores.dart';
import 'package:dado_magico/enum_dados.dart';
import 'package:flutter/animation.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  double position0 = 0;
  

  void animation() async {
    for (int i = 0; i < 2; i++) {
      await _animationController.forward();
      await _animationController.reverse();
      await _animationController.animateTo(0.5);
    }
    sortear();
    sortearCor();
  }

  

  int numberDado = 1;
  Random numberDrawn = Random();
  String myNumber = '';
  double mudarTamanhoFont = 25;
  Color mudarCor = CoresDados.rosa;
  Color backContainer = CoresDados.container1;

  void sortear() {
    setState(() {
      numberDado = numberDrawn.nextInt(6) + 1;
      myNumber = DadosOption.values[numberDado - 1].name;
      
      mudarTamanhoFont =
          DadosOptionIntExtension(DadosOption.values[numberDado - 1])
              .tamanhoFont;
    
    });
  }

  void sortearCor() {
    setState(() {
     mudarCor = DadosOptionExtension(DadosOption.values[numberDado - 1]).color;
     backContainer = DadosContainerExtension(DadosOption.values[numberDado - 1]).backColor;
    });
  }

  @override
  void initState() {
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final alturaTela = MediaQuery.of(context).size.height;
    
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: RotationTransition(
              turns: Tween(begin: position0, end: 0.2)
                  .animate(_animationController),
              child: GestureDetector(
                onTap: (() {
                  setState(() {
                    position0 = -0.2;
                  });
                  animation();
                }),
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  width: 100 + 50 * double.parse(numberDado.toString()),
                  height: 100 + 50 * double.parse(numberDado.toString()),
                  color: backContainer,
                  child: Center(
                    child: AnimatedDefaultTextStyle(
                      curve: Curves.slowMiddle,
                      duration: const Duration(seconds: 4),
                      child: Text(numberDado.toString()),
                      style: TextStyle(
                          fontSize: mudarTamanhoFont, color: mudarCor),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: alturaTela * 0.1,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
