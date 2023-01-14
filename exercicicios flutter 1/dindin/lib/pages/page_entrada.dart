import 'package:dindin/controllers/login_controller.dart';
import 'package:dindin/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

 

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
 
  

  @override
  void initState() {
    super.initState();
    LoginController.controle.loginUser(context);
  }

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final controle = Provider.of<LoginController>(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.purple, Colors.pink, Colors.grey])),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_balance,
              size: altura * 0.2,
              color: Colors.white,
            ),
            Text(
              'Bufunfa',
              style: TextStyle(color: Colors.white, fontSize: 48),
            )
          ],
        )),
      ),
    );
  }
}
