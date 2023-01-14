import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyProgress());
}

class MyProgress extends StatefulWidget {
  const MyProgress({Key? key}) : super(key: key);

  @override
  State<MyProgress> createState() => _MyProgressState();
}

class _MyProgressState extends State<MyProgress> {
  var progresso = 0;

  void setProgresso(int valor) {
    setState(() {
      progresso += valor;
    });
  }

  String get andamento {
    if (progresso == 0) {
      return 'Click para fazer o download';
    } else if (progresso >= 100) {
      return 'Upload completo';
    } else {
      return '$progresso%';
    }
  }

  void upload() {
    final sorteado = Random();
    final valor = sorteado.nextInt(14) + 1;
    setProgresso(valor);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Progress'),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: upload,
                child: const Text('Upload'),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(andamento),
              const SizedBox(
                height: 10,
              ),
              Custom(percentual: progresso),
            ],
          ),
        ),
      ),
    );
  }
}

class Custom extends StatelessWidget {
  const Custom({
    Key? key,
    required this.percentual,
  }) : super(key: key);

  final int percentual;

  @override
  Widget build(BuildContext context) {
    final cor = percentual >= 100 ? Colors.greenAccent : Colors.amber.shade300;

    return LinearProgressIndicator(
      value: percentual / 100,
      minHeight: 16,
      backgroundColor: Colors.amber.shade300,
      color: cor,
    );
  }
}
