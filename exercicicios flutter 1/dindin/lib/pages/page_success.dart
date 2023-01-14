import 'package:dindin/controllers/login_controller.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Success extends StatefulWidget {
  const Success({
    Key? key,
  }) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  void initState() {
    super.initState();
    LoginController.controle.loadInfos();
  }

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<LoginController>(context);
    return _controller.loading ? Center(child: CircularProgressIndicator(),) : Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.purple, Colors.pink, Colors.grey])),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      _controller.logout(context);
                    },
                    icon: Icon(Icons.logout))
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text('Oi, ${_controller.name}'),
              ],
            ),
          ],
        ),
      ),
      body: _controller.loading ? Center(child: CircularProgressIndicator(),) : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Seu saldo atual', style: TextStyle(fontSize: 20, color: Colors.grey),),
            Text(
              _controller.ballance.toStringAsFixed(2),
              style: const TextStyle(color: Colors.pinkAccent, fontSize: 40),
            )
          ],
        ),
      ),
    );
  }
}
