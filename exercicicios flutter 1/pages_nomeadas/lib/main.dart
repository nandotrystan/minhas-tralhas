import 'package:flutter/material.dart';
import 'package:pages_nomeadas/pages/first_page.dart';
import 'package:pages_nomeadas/pages/second_page.dart';
import 'package:pages_nomeadas/repository.dart';

void main() {
  runApp(const MyApp());

  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: (config) {
          if (config.name != null) {
            final _msg = config.arguments as String;
            return MaterialPageRoute(
                builder: (context) => SecondScreen(msg: _msg));
          }
        },
        routes: {
          '/': (context) => const FirstScreen(),
          //'/second':(context) => const SecondScreen(),
        });
  }
}
