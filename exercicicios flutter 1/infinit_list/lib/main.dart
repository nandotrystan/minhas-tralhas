import 'package:flutter/material.dart';

import 'package:infinit_list/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Infinite Scroll',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
        ),
        body: const HomePage(),
      ),
    );
  }
}
// void main() {
//   runApp(const ListaInfinita());
// }

// class ListaInfinita extends StatelessWidget {
//   const ListaInfinita({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.greenAccent,
//           centerTitle: true,
//           title: const Text('Posts'),
//         ),
//         body: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: 1000,
//                 itemBuilder: (context, index) {
//                   return CardList(index);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CardList extends StatelessWidget {
//   const CardList(this.index, {Key? key}) : super(key: key);

//   final int index;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         title: Center(child: Text('Item nº: ${index + 1}')),
//         leading: const Icon(
//           Icons.star,
//           color: Colors.yellow,
//         ),
//       ),
//     );
//   }
// }
