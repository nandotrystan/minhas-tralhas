import 'package:flutter/material.dart';
import 'package:flutter_dark_mode/cor.dart';
import 'package:flutter_dark_mode/corC.dart';
import 'package:flutter_dark_mode/funcoes.dart';
import 'package:flutter_dark_mode/icone.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: DarkMode(),
      ),
    );
  }
}

class DarkMode extends StatefulWidget {
  const DarkMode({Key? key}) : super(key: key);

  @override
  State<DarkMode> createState() => _DarkModeState();
}

class _DarkModeState extends State<DarkMode> {
  final lista = [
    Botoes(icone: icone1, funcao: action1),
    Botoes(icone: icone2, funcao: action2),
    Botoes(icone: icone3, funcao: action3),
    Botoes(icone: icone4, funcao: action4),
    Botoes(icone: icone5, funcao: action5),
    Botoes(icone: icone6, funcao: action6),
  ];

  int item = -1;
  bool escuro = true;
  

  void selecionarOpcao(int index) {

    setState(() {
      item = index;

    });
  }

  void mudarTema() {
    setState(() {
      if (escuro) {
        cor1 = const Color(0xFF1B446B);
        cor2 = const Color(0x55F9F9F9);
        cor3 = const Color(0x55214B72);
        cor4 = const Color(0xFFc9c9c9);
        cor5 = const Color(0x5535638F);
        escuro = false;
      } else {
        cor1 = const Color(0xFF232323);
        cor2 = const Color(0xFF1B446B);
        cor3 = const Color(0x55214B72);
        cor4 = const Color(0x9935638F);
        cor5 = const Color(0x99F9F9F9);
        escuro = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [cor1, cor2]),
      ),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                iconeCasa,
                color: cor5,
                size: 65,
              ),
              Column(
                children: [
                  Text(
                    'SWEET HOME',
                    style: TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold, color: cor5),
                  ),
                  Text(
                    'O que gostaria de monitorar?',
                    style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold, color: cor5),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
            children: List.generate(
              6,
              (index) {
                return GestureDetector(
                  onTap: () {
                    selecionarOpcao(index);
                    
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    margin: const EdgeInsets.all(2),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: index == item ? cor4 : cor3,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          lista[index].icone,
                          color: cor5,
                          size: 45,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          lista[index].funcao,
                          style: TextStyle(
                              fontSize: 18,
                              color: cor5,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  escuro ? 'Light Mode' : 'Dark Mode',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: cor5,
                  ),
                ),
                Switch(
                  activeColor: cor3,
                  value: escuro,
                  onChanged: (value) {
                    mudarTema();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
