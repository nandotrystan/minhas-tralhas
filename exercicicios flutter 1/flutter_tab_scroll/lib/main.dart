import 'package:flutter/material.dart';

void main() {
  runApp(const TabScroll());
}

class TabScroll extends StatelessWidget {
  const TabScroll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rotulos = [
      'Tab 1',
      'Tab 2',
      'Tab 3',
      'Tab 4',
      'Tab 5',
      'Tab 6',
      'Tab 7',
      'Tab 8',
      'Tab 9',
    ];
    return MaterialApp(
      home: DefaultTabController(
        length: rotulos.length,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Tab Scroll', style: TextStyle(fontSize: 32),
            ),
            backgroundColor: Colors.lightBlueAccent,
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.black,
              tabs: [
                for (final rotulo in rotulos)
                Tab(
                  child: Text(rotulo, 
                  style: const TextStyle(fontSize: 24),
                  ),
                  ),
              ],

              ),
          ),
          body: TabBarView(children: [
            for (final rotulo in rotulos)
            Center(
              child: Text(rotulo, style: const TextStyle(fontSize: 48),),
            )
          ]),
          ),
      ),
    );
  }
}
