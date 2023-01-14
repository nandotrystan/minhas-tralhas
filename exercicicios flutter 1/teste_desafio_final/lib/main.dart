import 'package:flutter/material.dart';
import 'package:teste_desafio_final/repositories/user_repository.dart';
import 'package:teste_desafio_final/routes/apresentation.dart';
import 'package:teste_desafio_final/routes/login.dart';
import 'package:teste_desafio_final/routes/splash.dart';
import 'package:teste_desafio_final/slave.dart';
import 'package:widget_mask/widget_mask.dart';

void main() async{
  final myapp = UserRepository();
  runApp(const MyApp());
  // await myapp.register(
  //     fullName: 'Luiz Édino Cardoso Coelho',
  //     cpf: '03380038512',
  //     email: 'edu_crazy67@hotmail.com',
  //     password: '1988edu');
  await myapp.login(cpf: "03380038512", password: "1988Edu");
  
  // Future.delayed(Duration(seconds: 4));
  await myapp.updateUser(
      fullName: 'Luiz Edu Cardoso Coelho',
      cpf: '03380038512',
      email: 'Luiz_cardoso_88@hotmail.com',
      password: '1988edu');
  await myapp.fetchInfo();

  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MySlave()
    

);
  }
}

class CustomClipperPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();

    path.lineTo(0, 0);
    path.lineTo(0, h / 3);
    path.quadraticBezierTo(w / 2, h / 3 - 200, w, h / 3);
    path.lineTo(w, h / 3);
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

