import 'package:desafio_listas/Strings.dart';
import 'package:flutter/material.dart';

class MySheet extends StatefulWidget {
  //final void Function(String) onSubmit;

  MySheet({Key? key}) : super(key: key);

  @override
  State<MySheet> createState() => _MySheetState();
}

class _MySheetState extends State<MySheet> {
  final inputTitleController = TextEditingController();
  final inputSubitleController = TextEditingController();

  @override
  void dispose() {
    inputTitleController.dispose();
    inputSubitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 425,
      height: 261,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              Strings.sheetTitle,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            TextField(
              keyboardType: TextInputType.text,
              autofocus: true,
              decoration: InputDecoration(hintText: Strings.inputTitle),
              textInputAction: TextInputAction.next,
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(hintText: Strings.inputSubtitle),
            ),
          ],
        ),
      ),
    );
  }
}
