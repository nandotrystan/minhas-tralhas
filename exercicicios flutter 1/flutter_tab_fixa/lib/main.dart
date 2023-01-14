import 'package:flutter/material.dart';

void main() {
  runApp(const MyfixedTab());
}

class MyfixedTab extends StatelessWidget {
  const MyfixedTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pets = [
      'CATIOROS',
      'GATINEOS',
      'PASSARINEOS'
    ];
    return MaterialApp(
        home: DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meu pet: A loja do seu pet'),
          centerTitle: false,
          backgroundColor: Colors.blueAccent,
          leading: ClipRRect(
            child: Image.network('https://i.imgur.com/eFAr5QX.png'),
          ),
          bottom: TabBar(
            indicatorColor: Colors.red,
            tabs: [
              for (final pet in pets) 
                Tab(
                  child: Text(
                    pet,
                    style: const TextStyle(fontSize: 18),
                ),
              ),
              
            ],
          ),
        ),
        body: TabBarView(
          children: [
            for (final pett in pets)
            Center(
              child: Text(pett)
            ),
          ],
        ),
      ),
    ));
  }
}


