import 'package:flutter/material.dart';
import 'package:flutter_navegacao/pages/page_one.dart';
import 'package:flutter_navegacao/pages/page_two.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final GlobalKey<NavigatorState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            Container(
              color: Colors.amberAccent,
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        if (_key.currentContext != null) {
                          Navigator.of(_key.currentContext!).pushNamed('first');
                        }
                      },
                      color: Colors.black,
                      icon: Icon(Icons.padding_sharp)),
                  IconButton(
                      onPressed: () {
                        if (_key.currentContext != null) {
                          Navigator.of(_key.currentContext!).pushNamed('second');
                        }
                      },
                      color: Colors.red,
                      icon: Icon(
                        Icons.sports,
                      ))
                ],
              ),
            ),
            Expanded(
                child: Center(
              child: Navigator(
                key: _key,
                initialRoute: 'first',
                onGenerateRoute: (config) {
                  late Widget page;
                  if (config.name == 'first') {
                    page = PageOne();
                  } else {
                    page = PageTwo();
                  }
                  return PageRouteBuilder(
                    pageBuilder: (_, __, ___) => page,
                  );
                },
              ),
            )),
          ],
        ),
      ),
    );
  }
}
