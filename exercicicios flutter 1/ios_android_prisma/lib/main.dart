import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ios_android_prisma/acessorios/enum.dart';
import 'package:ios_android_prisma/acessorios/factory.dart';
import 'package:flutter/cupertino.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetApp2(meuSistema: MeuSistema.iOS);
  }
}
