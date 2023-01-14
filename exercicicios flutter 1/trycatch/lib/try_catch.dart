import 'package:flutter/material.dart';
import 'package:trycatch/strings.dart';

class TryCatch extends StatefulWidget {
  const TryCatch({Key? key}) : super(key: key);

  @override
  State<TryCatch> createState() => _TryCatchState();
}

class _TryCatchState extends State<TryCatch> {
  TextEditingController valueOneController = TextEditingController();
  TextEditingController valueTwoController = TextEditingController();

  Color color = Colors.pinkAccent.shade400;
  FocusNode input1 = FocusNode();
  FocusNode input2 = FocusNode();
  double valueOne = 0;
  double valueTwo = 0;
  double result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Strings.title,
          style: TextStyle(fontSize: 32),
        ),
        centerTitle: true,
        backgroundColor: color,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          MyField(
            valueController: valueOneController,
            inputt: input1,
          ),
          MyField(
            valueController: valueTwoController,
            inputt: input2,
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: checkResult,
            color: color,
            child: const Text(
              Strings.textBotton,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void showMsg(String msg) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(msg),
          );
        });
  }

  void checkResult() {
    try {
      valueOne = double.parse(valueOneController.text);
    } catch (erro) {
      FocusScope.of(context).requestFocus(input1);
      showMsg(Strings.errorDescription);
      return;
    }
    try {
      valueTwo = double.parse(valueTwoController.text);
    } catch (erro) {
      FocusScope.of(context).requestFocus(input2);
      showMsg(Strings.errorDescription);
      return;
    }

    plus();
    clearInputs();
  }

  void plus() {
    result = valueOne + valueTwo;
    showMsg('Resultado: ${result.toStringAsFixed(2)}');
  }

  void clearInputs() {
    valueOne = 0;
    valueTwo = 0;
    valueOneController.text = '';
    valueTwoController.text = '';
    FocusScope.of(context).requestFocus(input1);
  }
}

class MyField extends StatelessWidget {
  const MyField({Key? key, required this.valueController, required this.inputt})
      : super(key: key);

  final TextEditingController valueController;
  final FocusNode inputt;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: TextField(
        style: TextStyle(
            fontSize: 16,
            color: Colors.pink.shade400,
            fontWeight: FontWeight.bold),
        controller: valueController,
        textAlign: TextAlign.center,
        focusNode: inputt,
      ),
    );
  }
}
