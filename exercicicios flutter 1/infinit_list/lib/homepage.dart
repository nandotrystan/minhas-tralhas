import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1000,
      itemBuilder: ((context, index) {
      return ListTile(
        leading: Text((index + 1).toString()),
        title: Text('AAA'),
        subtitle: Text('aaa'),
      );
    }));
  }
}
