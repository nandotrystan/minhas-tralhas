import 'dart:ui';

import 'package:desafio_listas/blocs/alllist_cubit.dart';
import 'package:desafio_listas/my_list.dart';
import 'package:desafio_listas/my_sheet.dart';
import 'package:desafio_listas/my_sheet_remove.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Strings.dart';
import 'class_model_list.dart';

class MyTask extends StatefulWidget {
  const MyTask({Key? key}) : super(key: key);

  @override
  State<MyTask> createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> {
  @override
  Widget build(BuildContext context) {
    // List<Lista> listaaa = [
    //   Lista(title: Strings.title, content: Strings.subtitleCard),
    //   Lista(title: 'Lavar a casa', content: 'Agora'),
    // ];
    final theme = Theme.of(context);
    return BlocBuilder<AllListCubit, List<Lista>>(
      builder: (context, state) {
        final cubit = context.read<AllListCubit>();
        return Scaffold(
          appBar: AppBar(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(Strings.title),
                Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondary,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  width: 16,
                  height: 16,
                  child: Center(
                      child: Text(
                    cubit.state.length.toString(),
                    style: TextStyle(
                        fontSize: 10, color: theme.colorScheme.primary),
                  )),
                ),
              ],
            ),
          ),
          body: MyList(theme: theme),
          floatingActionButton: FloatingActionButton(
            onPressed: () => showModalBottomSheet(
                context: context,
                builder: (context) => MySheet(),
                isDismissible: false,
                barrierColor: Colors.black.withOpacity(0.7),
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(40)))),
            child: Icon(
              Icons.add_outlined,
              color: theme.colorScheme.primaryContainer,
              size: 49,
            ),
            //backgroundColor: theme.colorScheme.tertiary,
          ),
        );
      },
    );
  }
}
