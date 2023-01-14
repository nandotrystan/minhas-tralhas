import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) {
                  // debugPrint(index.toString());
                  if (index == 0) {
                    return const Text('Começo da lista');
                  } else {
                    return ContainerCell(index: index);
                  }
                },
              ),
              // child: ListView(
              //   children: const [
              //     ContainerCell(),
              //     ContainerCell(),
              //     ContainerCell(),
              //     ContainerCell(),
              //     ContainerCell(),
              //     ContainerCell(),
              //     ContainerCell(),
              //     ContainerCell(),
              //     ContainerCell(),
              //     ContainerCell(),
              //     ContainerCell(),
              //     ContainerCell(),
              //     ContainerCell(),
              //     ContainerCell(),
              //     ContainerCell(),
              //     ContainerCell(),
              //     ContainerCell(),
              //     ContainerCell(),
              //     ContainerCell(),
              //     ContainerCell(),
              //     ContainerCell(),
              //     ContainerCell(),
              //     ContainerCell(),
              //     ContainerCell(),
              //   ],
              // ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerCell extends StatelessWidget {
  const ContainerCell({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(10.0),
      alignment: Alignment.center,
      color: Colors.grey,
      child: Text(
        'Celula do index $index',
        style: const TextStyle(fontSize: 24.0),
      ),
    );
  }
}
