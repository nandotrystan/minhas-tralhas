import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _animationController2;

  void animation() async {
    _animationController2.reverse();
    //await _animationController2.forward();
    //await _animationController2.animateTo(0.5);
  }

  @override
  void initState() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 4), vsync: this)
          ..forward();

    _animationController2 = AnimationController(
        duration: const Duration(seconds: 0),
        reverseDuration: const Duration(seconds: 4),
        vsync: this)
      ..forward();
    animation();

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        //alignment: Alignment.topRight,
        children: [
          Image.asset(
            'assets/images/hunter1.png',
            alignment: Alignment.topRight,
            height: altura,
            width: largura,
          ),
          Image.asset(
            'assets/images/hunter2.png',
            alignment: Alignment.topRight,
            height: altura,
            width: largura,
          ),
          Column(
            children: [
              SizedBox(
                height: altura * 0.12,
              ),
              Center(
                child: Row(
                  children: [
                    Spacer(
                      flex: largura > 600 ? 22 : 18,
                    ),
                    RotationTransition(
                      turns: _animationController,
                      child: Image.asset(
                        'assets/images/triangle_back.png',
                        alignment: Alignment.center,
                      ),
                    ),
                    Spacer(
                      flex: largura > 600 ? 21 : 17,
                    )
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(height: altura * 0.1),
              Center(
                child: RotationTransition(
                  turns: _animationController2,
                  child: Image.asset(
                    'assets/images/Vector.png',
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(height: altura * 0.19),
              Center(
                child: Image.asset(
                  'assets/images/las.png',
                  alignment: Alignment.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
