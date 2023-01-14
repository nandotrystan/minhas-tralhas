
import 'package:dindin/controllers/login_controller.dart';
import 'package:dindin/pages/page_entrada.dart';
import 'package:dindin/pages/page_login.dart';
import 'package:dindin/pages/page_success.dart';
import 'package:dindin/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() async{
  runApp(ChangeNotifierProvider(
      create: (context) => LoginController.controle,
      child: const MyApp()));
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => const PageOne(),
            '/login':(context) => const Login(),
            '/home':(context) => const Success()
            },  
        
    );
  }
}
