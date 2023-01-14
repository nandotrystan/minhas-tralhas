import 'package:desafio_listas/blocs/alllist_cubit.dart';
import 'package:desafio_listas/task.dart';
import 'package:desafio_listas/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AllListCubit(),
      child: MaterialApp(
        themeMode: ThemeMode.light,
        theme: ListTheme.light,
        darkTheme: ListTheme.dark,
        home: const MyTask(),
      ),
    );
  }
}
