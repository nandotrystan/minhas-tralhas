import 'package:flutter/material.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('FAB Animation'),
        leading: Icon(Icons.star_border),
        ),
        body: const Center(
          child: MyAnimation(),
        ),
      ),
    );
  }
}

class MyAnimation extends StatefulWidget {
  const MyAnimation({Key? key}) : super(key: key);

  @override
  State<MyAnimation> createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation> {
  bool isCircle = true;

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;
    final altura = MediaQuery.of(context).size.height;
    final alturaDisponivel = altura - AppBar().preferredSize.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            width: isCircle ? 40.0 : 200.0,
            height: 40.0,
            bottom: isCircle ? 0 : alturaDisponivel - 56,
            right: isCircle ? 0 : largura * 0.5 - 100,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isCircle = !isCircle;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(isCircle ? 20 : 5),
                    color: isCircle ? Colors.orange : Colors.redAccent),
                child: const Center(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
