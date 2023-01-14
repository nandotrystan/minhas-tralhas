import 'package:desafio_listas/Strings.dart';
import 'package:desafio_listas/blocs/alllist_cubit.dart';
import 'package:desafio_listas/class_model_list.dart';
import 'package:desafio_listas/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final cubit = context.read<AllListCubit>();
    final theme = Theme.of(context);

    return SizedBox(
      width: 425,
      height: 261,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              Strings.sheetTitle,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: inputTitleController,
              keyboardType: TextInputType.text,
              autofocus: true,
              decoration: const InputDecoration(hintText: Strings.inputTitle),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: inputSubitleController,
              keyboardType: TextInputType.text,
              decoration:
                  const InputDecoration(hintText: Strings.inputSubtitle),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  height: 80,
                  color: theme.colorScheme.secondary,
                  onPressed: () {
                    cubit.addTask(
                        inputTitleController.text, inputSubitleController.text);
                    inputTitleController.clear();
                    inputSubitleController.clear();
                  },
                  child: const Icon(
                    Icons.save,
                    color: Colors.white,
                    size: 40,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
