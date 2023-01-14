import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:ios_android_prisma/acessorios/enum.dart';
import 'package:ios_android_prisma/acessorios/factory.dart';
import 'package:flutter/cupertino.dart';
import 'package:ios_android_prisma/pages/help.dart';
import 'package:ios_android_prisma/pages/ipad.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return LayoutBuilder(builder: ((context, constraints) {
      if (constraints.maxWidth < 600) {
        return GetApp2(meuSistema: MeuSistema.iOS,);
      } else {
        return CupertinoApp(
          home: CupertinoPageScaffold(
            navigationBar: const CupertinoNavigationBar(
              leading: Icon(
                Icons.arrow_back_ios_new,
                color: Color(0xFF007AFF),
              ),
              middle: Text(
                'Ajuda',
                style: TextStyle(color: Colors.black),
              ),
    
            ),
            child: Row(
              children: const [
                Expanded(child: PageClient()),
                Expanded(child: PageHelp()),
              ],
            ),
          ),
        );
        //Row();
      }
    }));
    //GetApp2(meuSistema: MeuSistema.iOS);
  }
}




