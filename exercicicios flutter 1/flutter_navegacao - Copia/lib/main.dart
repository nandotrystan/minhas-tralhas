import 'package:flutter/material.dart';
import 'package:flutter_navegacao/pages/page_one.dart';
import 'package:flutter_navegacao/pages/page_two.dart';

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
    int page = 0;
    var status = iconActive.first;
    PageController _controller = PageController();

    changePage() {
      setState(() {
        page = status == iconActive.first ? 0 : 1;
        _controller.jumpToPage(page);
      });
    }
    

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
                        setState(() {
                          status = iconActive.first;
                        });
                        changePage();
                      },
                      color: Colors.black,
                      icon: const Icon(Icons.padding_sharp)),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          status = iconActive.second;
                        });
                        changePage();
                      },
                      color: Colors.red,
                      icon: const Icon(
                        Icons.sports,
                      ))
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _controller,
                
                children: [
                  PageOne(
                    controller: _controller,
                  ),
                  PageTwo(
                    controller: _controller,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum iconActive {
  first,
  second,
}
