import 'package:flutter/material.dart';

import 'cores.dart';

void main() {
  runApp(const Rainbow());
}

class Rainbow extends StatefulWidget {
  const Rainbow({Key? key}) : super(key: key);

  @override
  State<Rainbow> createState() => _RainbowState();
}

class _RainbowState extends State<Rainbow> {
  final lista = [
    Cores(nomeCor: 'Vermelho', cor: Colors.red),
    Cores(nomeCor: 'Laranja', cor: Colors.orange),
    Cores(nomeCor: 'Amarelo', cor: Colors.yellow),
    Cores(nomeCor: 'Verde', cor: Colors.green),
    Cores(nomeCor: 'Azul', cor: Colors.blue),
    Cores(nomeCor: 'Anil', cor: const Color.fromARGB(255, 56, 100, 122)),
    Cores(nomeCor: 'Violeta', cor: Colors.purple),
  ];

  int ind = 0;

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          centerTitle: true,
          title: const Text('VLAVAAV Horizontal', 
          style: TextStyle(
            letterSpacing: 2, 
            fontSize: 28),),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 77,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if (index >= 7) {
                      ind = index % 7;
                    } else {
                      ind = index;
                    }
                    final listaD = lista[ind];
                    return Row(
                      children: [
                        Container(
                          width: 70,
                          color: listaD.cor,
                          child: Center(
                            child: RotatedBox(
                              quarterTurns: 3,
                              child: Text(
                                listaD.nomeCor,
                                style: const TextStyle(
                                    letterSpacing: 2,
                                    color: Colors.white,
                                    fontSize: 32),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
