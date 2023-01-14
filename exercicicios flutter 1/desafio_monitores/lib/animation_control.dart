import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyAnimation(),
    );
  }
}

class MyAnimation extends StatefulWidget {
  const MyAnimation({Key? key}) : super(key: key);

  @override
  State<MyAnimation> createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<RelativeRect> _animation;
  bool isCircle = true;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
  }

  clicar() {}

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double circle = 40;
    const double retangle = 200;
    final largura = MediaQuery.of(context).size.width;
    final altura = MediaQuery.of(context).size.height;
    final alturaDisponivel = altura - AppBar().preferredSize.height;

    final _curves =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    _animation = RelativeRectTween(
            begin: RelativeRect.fromLTRB(
                largura - circle, alturaDisponivel - circle, 0, 0),
            end: RelativeRect.fromLTRB(largura / 2 - retangle, 0,
                largura / 2 - retangle, alturaDisponivel - circle))
        .animate(_curves)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.stop();
        }
      });

    return Scaffold(
        appBar: AppBar(
          title: const Text('FAB Animation'),
          leading: const Icon(Icons.star_border),
        ),
        body: Stack(
          children: [
            PositionedTransition(
              rect: _animation,
              child: GestureDetector(
                onTap: () {
                  isCircle
                      ? _animationController.forward()
                      : _animationController.reverse();
                  isCircle = !isCircle;
                },
                child: Container(
                  
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(isCircle ? 20 : 5),
                    color: Colors.red),
                ),
              ),
            ),
          ],
        ));
  }
}
