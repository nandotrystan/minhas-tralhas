import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:minha_idade/strings.dart';

class MinhaIdade extends StatefulWidget {
  const MinhaIdade({Key? key}) : super(key: key);

  @override
  State<MinhaIdade> createState() => _MinhaIdadeState();
}

class _MinhaIdadeState extends State<MinhaIdade> {
  TextEditingController dataController =
      TextEditingController(text: Strings.pedirData);
  Color corPadrao = Colors.red.shade700;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            dataController.text,
            style: TextStyle(fontWeight: FontWeight.bold, color: corPadrao),
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            color: corPadrao,
            onPressed: dateTime,
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                Strings.calendar,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void dateTime() {
    final now = DateTime.now();
    showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(1900),
      lastDate: now,
      builder: (context, parte) => Theme(
        child: Center(child: parte),
        data: ThemeData().copyWith(
          colorScheme: ColorScheme.light(
            primary: corPadrao,
          ),
        ),
      ),
    ).then((value) {
      setState(() {
        dataController.text = calcularIdade(value);
      });
    });
  }

  String calcularIdade(dataEnviada) {
    if (dataEnviada != null) {
      DateTime dataAtual = DateTime.now();
      if (dataAtual.year > dataEnviada.year) {
        if (dataAtual.month >= dataEnviada.month) {
          if (dataAtual.month > dataEnviada.month) {
            return '${dataAtual.year - dataEnviada.year} ${Strings.fraseIdade}';
          }
          if (dataAtual.day >= dataEnviada.day) {
            return '${dataAtual.year - dataEnviada.year} ${Strings.fraseIdade}';
          } else {
            return '${dataAtual.year - dataEnviada.year - 1} ${Strings.fraseIdade}';
          }
        } else {
          return '${dataAtual.year - dataEnviada.year - 1} ${Strings.fraseIdade}';
        }
      }
    }
    return Strings.invalidDate;
  }

  @override
  void dispose() {
    dataController.dispose();
    super.dispose();
  }
}
