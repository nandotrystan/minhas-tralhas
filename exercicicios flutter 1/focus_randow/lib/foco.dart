import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:focus_randow/inputs.dart';

class Foco extends StatefulWidget {
  Foco({Key? key}) : super(key: key);

  final campo = FocusInput();

  @override
  State<Foco> createState() => _FocoState();
}

class _FocoState extends State<Foco> {
  int numberInicial = 0;
  Random numero = Random();

  FocusNode input1 = FocusNode();
  FocusNode input2 = FocusNode();
  FocusNode input3 = FocusNode();
  FocusNode input4 = FocusNode();
  FocusNode input5 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Sorteado: $numberInicial',
            style: TextStyle(
              color: widget.campo.cor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          NewField(input: input1),
          NewField(input: input2),
          NewField(input: input3),
          NewField(input: input4),
          NewField(input: input5),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: MaterialButton(
                onPressed: mudarFoco,
                color: widget.campo.cor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    FocusInput.title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ),

          // Expanded(
          //   child: ListView.builder(
          //     itemCount: 5,
          //     itemBuilder: (context, index) {
          //       final focuss = focoDefinido(index);
          //       return TextField(
          //         keyboardType: TextInputType.text,
          //         focusNode: focuss,
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }

  void mudarFoco() {
    int number = numero.nextInt(5) + 1;

    while (number == numberInicial) {
      number = numero.nextInt(5) + 1;
    }
    setState(() {
      switch (number) {
        case 1:
          FocusScope.of(context).requestFocus(input1);
          numberInicial = 1;
          break;
        case 2:
          FocusScope.of(context).requestFocus(input2);
          numberInicial = 2;
          break;
        case 3:
          FocusScope.of(context).requestFocus(input3);
          numberInicial = 3;
          break;
        case 4:
          FocusScope.of(context).requestFocus(input4);
          numberInicial = 4;
          break;
        case 5:
          FocusScope.of(context).requestFocus(input5);
          numberInicial = 5;
          break;
      }
    });
  }

  focoDefinido(int index) {
    FocusNode focuss;
    setState(() {
      if (index == 0) {
        focuss = input1;
      }
      if (index == 1) {
        focuss = input2;
      }
      if (index == 2) {
        focuss = input3;
      }
      if (index == 3) {
        focuss = input4;
      }
      if (index == 4) {
        focuss = input5;
      }
    });
  }
}

class NewField extends StatelessWidget {
  const NewField({
    Key? key,
    required this.input,
  }) : super(key: key);

  final FocusNode input;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      focusNode: input,
    );
  }
}
