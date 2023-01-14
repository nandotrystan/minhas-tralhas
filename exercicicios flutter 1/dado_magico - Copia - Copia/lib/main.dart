import 'dart:math';

import 'package:dado_magico/cores.dart';
import 'package:dado_magico/enum_dados.dart';

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

class _MyHomeState extends State<MyHome> {
  int numberDado = 1;
  Random numberDrawn = Random();
  String myNumber = '';
  double mudarTamanhoFont = 25;
  Color mudarCor = CoresDados.rosa;
  Color backContainer = CoresDados.container1;
  double tamanhoBatatinha = 0;

  void sortear() {
    setState(() {
      numberDado = numberDrawn.nextInt(6) + 1;
      tamanhoBatatinha += numberDado * 3;
      myNumber = DadosOption.values[numberDado - 1].name;
      
      mudarTamanhoFont =
          DadosOptionIntExtension(DadosOption.values[numberDado - 1])
              .tamanhoFont;
  
    });
  }

  Color sortearCor() {
    setState(() {
      mudarCor = DadosOptionExtension(DadosOption.values[numberDado - 1]).color;
    });
    return mudarCor;
  }

  Color sortearCorFundo() {
    setState(() {
      backContainer =
          DadosContainerExtension(DadosOption.values[numberDado - 1]).backColor;
    });
    return backContainer;
  }


  @override
  Widget build(BuildContext context) {
    final alturaTela = MediaQuery.of(context).size.height;
    //final larguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(tamanhoBatatinha.toString()),
          Expanded(
            child: TweenAnimationBuilder(
                tween: ColorTween(begin: Colors.white, end: Colors.yellow),
                duration: Duration(seconds: 5),
                builder: (context, Color? color, child) {
                  return Center(
                    child: tamanhoBatatinha >= 400
                        ? Icon(Icons.whatshot, size: 400, color: Colors.redAccent.shade700,)
                        : Container(
                            width: tamanhoBatatinha,
                            height: tamanhoBatatinha,
                            decoration: BoxDecoration(
                              color: color,
                                borderRadius:
                                    BorderRadius.circular(tamanhoBatatinha / 2)),
                          ),
                  );
                }),
          ),
           SizedBox(
            height: alturaTela * 0.1,
          ),
          GestureDetector(
            onTap: (() {
              sortear();
              sortearCor();
              sortearCorFundo();
            }),
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: 100 + 5 * double.parse(numberDado.toString()),
              height: 100 + 5 * double.parse(numberDado.toString()),
              color: backContainer,
              child: Center(
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(seconds: 1),
                  child: Text(numberDado.toString()),
                  style: TextStyle(fontSize: mudarTamanhoFont, color: mudarCor),
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
