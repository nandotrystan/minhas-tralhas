import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MySlave extends StatefulWidget {
  const MySlave({Key? key}) : super(key: key);

  @override
  State<MySlave> createState() => _MySlaveState();
}

class _MySlaveState extends State<MySlave> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            snap: false,
            pinned: false,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("AAAAA",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ) //TextStyle
                    ), //Text
                background: Image.network(
                  "https://i.ibb.co/QpWGK5j/Geeksfor-Geeks.png",
                  fit: BoxFit.cover,
                ) //Images.network
                ), //FlexibleSpaceBar
            expandedHeight: 230,
            backgroundColor: Colors.greenAccent[400],
            leading: IconButton(
              icon: Icon(Icons.menu),
              tooltip: 'Menu',
              onPressed: () {},
            ), //IconButton
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.comment),
                tooltip: 'Comment Icon',
                onPressed: () {},
              ), //IconButton
              IconButton(
                icon: Icon(Icons.settings),
                tooltip: 'Setting Icon',
                onPressed: () {},
              ), //IconButton
            ], //<Widget>[]
          ),
        ],
          )); //SliverAppBar
    
  }
}
