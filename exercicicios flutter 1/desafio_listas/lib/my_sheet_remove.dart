import 'package:desafio_listas/blocs/alllist_cubit.dart';
import 'package:desafio_listas/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MySheetRemoved extends StatefulWidget {
  const MySheetRemoved({Key? key}) : super(key: key);

  @override
  State<MySheetRemoved> createState() => _MySheetRemovedState();
}

class _MySheetRemovedState extends State<MySheetRemoved> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AllListCubit>();

    return SizedBox(
      width: 428,
      height: 174,
      child: Padding(
        padding: const EdgeInsets.only(top: 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Deseja remover ${cubit.showTask}')],
        ),
      ),
    );
  }
}
