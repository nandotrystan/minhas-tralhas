import 'dart:async';
import 'dart:math';

import 'package:async_bet/colors.dart';
import 'package:async_bet/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AsyncBet extends StatefulWidget {
  AsyncBet({Key? key}) : super(key: key);

  final color = ColorsBet();

  @override
  State<AsyncBet> createState() => _AsyncBetState();
}

class _AsyncBetState extends State<AsyncBet> {
  double weithRoad = 40;
  Color winnerColor = Colors.black;
  String winner = '';
  Random aleatorio = Random();
  double percen1 = 0;
  double percen2 = 0;
  double percen3 = 0;
  final stoped = stateRun.stoped;
  final running = stateRun.running;
  var game = stateRun.stoped;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: widget.color.green,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      Strings.title1,
                      style: TextStyle(fontSize: 32, color: widget.color.white),
                    ),
                    Text(
                      Strings.title2,
                      style:
                          TextStyle(fontSize: 32, color: widget.color.yellow),
                    ),
                  ],
                ),
                MaterialButton(
                  onPressed: startRun,
                  child: Text(
                    Strings.textButton,
                    style: TextStyle(fontSize: 16, color: widget.color.green),
                  ),
                  color: widget.color.white,
                ),
              ],
            )),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RotatedBox(
                quarterTurns: 3,
                child: MyLinear(
                    weithRoad: weithRoad,
                    percen: percen1,
                    color: widget.color.colorRoadRed,
                    color2: widget.color.roadBack),
              ),
              RotatedBox(
                quarterTurns: 3,
                child: MyLinear(
                  weithRoad: weithRoad,
                  percen: percen2,
                  color: widget.color.colorRoadPurple,
                  color2: widget.color.roadBack,
                ),
              ),
              RotatedBox(
                quarterTurns: 3,
                child: MyLinear(
                  weithRoad: weithRoad,
                  percen: percen3,
                  color: widget.color.colorRoadBlue,
                  color2: widget.color.roadBack,
                ),
              ),
            ],
          ),
        ));
  }

  Future startRun() async {
    if (game == stoped) {
      game = running;
      //restart();

      while (percen1 <= 100 && percen2 <= 100 && percen3 <= 100) {
        setState(() {
          percen1 += aleatorio.nextDouble() * 10;
        });
        setState(() {
          percen2 += aleatorio.nextDouble() * 10;
        });
        setState(() {
          percen3 += aleatorio.nextDouble() * 10;
        });
        await Future.delayed(const Duration(seconds: 1));
      }
      if (percen1 >= 100) {
        winner = Strings.winnerRed;
        winnerColor = widget.color.colorRoadRed;
      }
      if (percen2 >= 100) {
        winner = Strings.winnerPurple;
        winnerColor = widget.color.colorRoadPurple;
      }
      if (percen3 >= 100) {
        winner = Strings.winnerBlue;
        winnerColor = widget.color.colorRoadBlue;
      }

      showWinner(winner, winnerColor);

    }
  }

  void showWinner(String winner, Color winnerColor) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              winner,
              style: TextStyle(fontSize: 24, color: winnerColor),
            ),
            actions: [
              TextButton(onPressed: restart, child: const Text(Strings.close))
            ],
          );
        });
  }

  void restart() {
    setState(() {
      percen1 = 0;
      percen2 = 0;
      percen3 = 0;
      game = stoped;
      Navigator.of(context).pop(false);
    });
  }
}

class MyLinear extends StatelessWidget {
  const MyLinear({
    Key? key,
    required this.weithRoad,
    required this.percen,
    required this.color,
    required this.color2,
  }) : super(key: key);

  final double weithRoad;
  final double percen;
  final Color color;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      minHeight: weithRoad,
      value: percen / 100,
      color: color,
      backgroundColor: color2,
    );
  }
}

enum stateRun {
  running,
  stoped,
}
