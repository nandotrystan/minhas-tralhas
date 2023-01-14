import 'package:flutter/material.dart';

typedef OperadorPressedCallback = void Function(String);

class OperadoresButtom extends StatelessWidget {
  const OperadoresButtom(
      {Key? key, required this.operador, required this.onOperadorPressed})
      : super(key: key);

  final String operador;
  final OperadorPressedCallback onOperadorPressed;

  IconData mapOperadorIconToData() {
    switch (operador) {
      case 'x':
        return Icons.close;
      case '-':
        return Icons.remove;
      default:
        return Icons.add;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
        onPressed: () => onOperadorPressed(operador),
        icon: Icon(mapOperadorIconToData()),
      ),
    );
  }
}
