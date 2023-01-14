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

  void sortear() {
    setState(() {
      numberDado = numberDrawn.nextInt(6) + 1;
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

  @override
  Widget build(BuildContext context) {
    final alturaTela = MediaQuery.of(context).size.height;
    //final larguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: alturaTela * 0.25,
              height: alturaTela * 0.25,
              color: Colors.grey,
              child: Center(
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(seconds: 1),
                  child: Text(numberDado.toString()),
                  style: TextStyle(fontSize: mudarTamanhoFont, color: mudarCor),
                ),
              ),
            ),
          ),
          SizedBox(
            height: alturaTela * 0.1,
          ),
          TextButton(
              onPressed: () {
                sortear();
                sortearCor();
              },
              child: const Text(
                'Jogar',
                style: TextStyle(color: Colors.blue),
              )),
        ],
      ),
    );
  }
}
