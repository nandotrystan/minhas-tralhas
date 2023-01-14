import 'dart:io';
import 'classe_calculadora.dart';
import 'tela.dart';

void main() {
  final line = stdin.readLineSync() ?? '';
  if (line.isEmpty) exit(0);
  final inputs = line.split(' ');

  final valor1 = double.parse(inputs[0]);
  final operador = inputs[1];
  final valor2 = double.parse(inputs[2]);

  final myCalculadora = Calculadora();
  final myTela = Tela();
  

  switch (operador) {
    case '-':
      myTela.mostrar(
          'Resultado de $valor1 $operador $valor2: ${myCalculadora.minus(valor1, valor2).toStringAsFixed(2)}');
      break;
    case '*':
      myTela.mostrar(
          'Resultado de $valor1 $operador $valor2: ${myCalculadora.multiply(valor1, valor2).toStringAsFixed(2)}');
      break;
    case '/':
      myTela.mostrar(
          'Resultado de $valor1 $operador $valor2: ${myCalculadora.divided(valor1, valor2).toStringAsFixed(2)}');
      break;
    case '+':
      myTela.mostrar(
          'Resultado de $valor1 $operador $valor2: ${myCalculadora.soma(valor1, valor2).toStringAsFixed(2)}');
      break;
    default:
      myTela.mostrar('Operação invalida!');
      break;
  }
}
