import 'package:flutter/material.dart';
import 'package:flutter_calculadora/calculadora/theme.dart';

import 'display.dart';
import 'numberButton.dart';
import 'operador_button.dart';

const appName = 'Calculadora Simples';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      themeMode: ThemeMode.light,
      theme: TemaCalculadoraSimples.light,
      darkTheme: TemaCalculadoraSimples.dark,
      home: const CalculadoraSimples(),
    );
  }
}

class CalculadoraSimples extends StatefulWidget {
  const CalculadoraSimples({Key? key}) : super(key: key);

  @override
  State<CalculadoraSimples> createState() => _CalculadoraSimplesState();
}

class _CalculadoraSimplesState extends State<CalculadoraSimples> {
  String display = '0';
  String firstNumber = '';
  static const operadores = ['x', '-', '+'];
  String operador = '';
  String secondNumber = '';

  void insert(String char) {
    if (operadores.contains(char)) {
      operador = char;
    } else {
      if (operador.isEmpty) {
        firstNumber += char;
      } else {
        secondNumber += char;
      }
    }
    setState(() {
      if (operador.isEmpty) {
        display = firstNumber;
      } else {
        if (secondNumber.isEmpty) {
          display = '$firstNumber $operador';
        } else {
          display = '$firstNumber $operador $secondNumber';
        }
      }
    });
  }

  void clear() {
    firstNumber = '';
    operador = '';
    secondNumber = '';
    setState(() {
      display = '0';
    });
  }
  // int easterEgg = 0;

  // void showEasterEgg(int value, BuildContext context) {
  //   easterEgg += value;
  //   if (easterEgg >= 7) {
  //     easterEgg = 0;
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text('Flutter é vida!'),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // final tema = Theme.of(context);
    return Scaffold(
      // backgroundColor: tema.colorScheme.primary,
      appBar: AppBar(
        title: const Text(appName),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 70.0),
        child: FloatingActionButton(
          onPressed: clear,
          child: const Text('C'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Display(display: display),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                NumberButton(number: '7', onNumberPressed: insert),
                NumberButton(number: '8', onNumberPressed: insert),
                NumberButton(number: '9', onNumberPressed: insert),
                OperadoresButtom(operador: 'x', onOperadorPressed: insert),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                NumberButton(number: '4', onNumberPressed: insert),
                NumberButton(number: '5', onNumberPressed: insert),
                NumberButton(number: '6', onNumberPressed: insert),
                OperadoresButtom(operador: '-', onOperadorPressed: insert),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                NumberButton(number: '1', onNumberPressed: insert),
                NumberButton(number: '2', onNumberPressed: insert),
                NumberButton(number: '3', onNumberPressed: insert),
                OperadoresButtom(operador: '+', onOperadorPressed: insert),
              ],
            ),
          ),
          const Expanded(child: Text('4ª linha')),
        ],
      ),
      // Container(
      //   alignment: Alignment.center,
      //   child: Text(
      //     appName,
      //     style: tema.textTheme.bodyText2,
      //   ),
      // ),
      // bottomNavigationBar: Container(
      //   height: 120.0,
      //   color: Colors.blueAccent,
      // ),
    );
  }

  // void onCardLongPress() {
  //   debugPrint('Click Longo');
  // }
}

// class OperadoresButtom extends StatelessWidget {
//   const OperadoresButtom({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: IconButton(
//         onPressed: () => insert('x'),
//         icon: const Icon(Icons.close),
//       ),
//     );
//   }
// }

// class NumberButton extends StatelessWidget {
//   const NumberButton({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: ElevatedButton(
//         onPressed: () {
//           insert('7');
//         },
//         child: const Text('7'),
//       ),
//     );
//   }
// }
