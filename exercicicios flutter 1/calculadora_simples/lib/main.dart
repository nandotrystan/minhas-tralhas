import 'package:calculadora_simples/Strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController numberController = TextEditingController();
  TextEditingController number2Controller = TextEditingController();

  int resultado = 0;

  void somar() {
    String number1;
    String number2;
    int valor1;
    int valor2;
    setState(() {
      number1 = numberController.text;
      number2 = number2Controller.text;
      valor1 = int.parse(number1);
      valor2 = int.parse(number2);
      resultado = valor1 + valor2;
    });
  }

  void limpar() {
    setState(() {
      numberController.clear();
      number2Controller.clear();
      resultado = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Calculadora Simples',
            style: TextStyle(fontSize: 32, letterSpacing: 2),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                'Resultado: $resultado',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 32),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: numberController,
                autofocus: true,
                textInputAction: TextInputAction.next,
                decoration:
                    const InputDecoration(labelText: Strings.firstNumber),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],

                  
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: number2Controller,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                decoration:
                    const InputDecoration(labelText: Strings.secondNumber),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: somar,
                    child: const Text(
                      Strings.somar,
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: limpar,
                    child: const Text(
                      Strings.clear,
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }


  String? emptyValidator(String? text) {
    if (text == null || text.isEmpty) {
      return Strings.errorMessageEmptyField;
    }
  }

  @override
  void dispose() {
    numberController.dispose();
    number2Controller.dispose();

    super.dispose();
  }


}

// class NewForms extends StatefulWidget {
//   const NewForms({Key? key, required this.labelX, required this.controller}) : super(key: key);

//   final String labelX;
//   TextEditingController controller;

//   @override
//   State<NewForms> createState() => _NewFormsState();
// }

// class _NewFormsState extends State<NewForms> {
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: widget.controller,
//       keyboardType: TextInputType.number,
//       decoration: InputDecoration(labelText: widget.labelX),
//     );
//   }
// }
