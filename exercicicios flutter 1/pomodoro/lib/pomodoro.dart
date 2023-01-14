import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pomodoro/Strings.dart';

class Pomodoro extends StatefulWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  State<Pomodoro> createState() => _PomodoroState();
}

class _PomodoroState extends State<Pomodoro> {
  TextEditingController assignmentController = TextEditingController();
  double percentage = 1.0;
  int allTime = 30;

  final nothing = pomodoState.none;
  final working = pomodoState.work;
  final resting = pomodoState.rest;

  var estado = pomodoState.none;

  Color colorButton2 = Colors.amber.shade800;
  Color colorCircle = Colors.grey.shade800;
  Color colorRest = const Color.fromARGB(255, 9, 167, 146);
  Color colorButton1 = Colors.grey.shade600;
  Color colorBack = Colors.grey.shade900;
  Color colorLetter = Colors.white;
  Color primarycolorButton = Colors.grey.shade600;
  String cronometro = Strings.title;
  String textoBot = Strings.textButton;
  Color primaryColor = Colors.amber.shade800;
  String tarefa = Strings.assignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorBack,
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          Builder(builder: (context) {
            return MaterialButton(
              onPressed: screenWhite,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  tarefa,
                  style: TextStyle(
                    fontSize: 16,
                    color: colorLetter,
                  ),
                ),
              ),
              color: colorCircle,
            );
          }),
          const SizedBox(
            height: 50,
          ),
          Stack(
            children: [
              Center(
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: CircularProgressIndicator(
                    strokeWidth: 30,
                    color: colorCircle,
                    value: percentage,
                  ),
                ),
              ),
              SizedBox(
                height: 300,
                child: Center(
                  child: Text(
                    cronometro,
                    style: TextStyle(
                      fontSize: 32,
                      color: colorLetter,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 70,
          ),
          Builder(builder: (context) {
            return Center(
              child: MaterialButton(
                onPressed: startPomodoro,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    textoBot,
                    style: TextStyle(
                      fontSize: 16,
                      color: colorLetter,
                    ),
                  ),
                ),
                color: colorButton2,
              ),
            );
          }),
        ],
      ),
    );
  }

  void addAssignment() {
    if (assignmentController.text.isNotEmpty) {
      setState(() {
        tarefa = assignmentController.text;
      });
    }
    Navigator.pop(context, false);
  }

  void clearAssignment() {
    setState(() {
      tarefa = Strings.add;
      assignmentController.text = "";
    });
    Navigator.pop(context, false); // Fecha o modal
  }

  void screenWhite() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              children: [
                TextField(
                  controller: assignmentController,
                  autofocus: true,
                ),
                const SizedBox(
                  height: 8,
                ),
                Builder(builder: (context) {
                  return Center(
                    child: MaterialButton(
                      onPressed: addAssignment,
                      child: const Text(Strings.add),
                      color: colorButton2,
                    ),
                  );
                }),
                const SizedBox(
                  height: 16,
                ),
                Builder(builder: (context) {
                  return Center(
                    child: MaterialButton(
                      onPressed: clearAssignment,
                      child: Text(
                        Strings.clear,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: colorLetter,
                        ),
                      ),
                      color: colorBack,
                    ),
                  );
                }),
              ],
            ),
          );
        });
  }

  void startPomodoro() {
    if (estado == nothing) {
      estado = working;
      
      allTime = 30;
      int time = allTime;
      setState(() {
        colorCircle = colorButton2;
        cronometro = time > 9 ? '00:$time' : '00:0$time';
      });
      Timer.periodic(const Duration(seconds: 1), (timer) {
        time--;

        if (time > 0) {
          setState(() {
            cronometro = time > 9 ? '00:$time' : '00:0$time';
            percentage -= (1 / allTime) / 1;
          });
        } else {
          timer.cancel();
          estado = resting;
          allTime = 5;
          setState(() {
            percentage = 1;
            colorCircle = colorRest;
            colorButton2 = colorRest;
            textoBot = Strings.startRest;
            cronometro = Strings.rest;
          });
        }
      });
    } else if (estado == resting) {
      estado = working;
      int time = allTime;

      Timer.periodic(const Duration(seconds: 1), (timer) {
        time--;

        if (time > 0) {
          setState(() {
            cronometro = time > 9 ? '00:$time' : '00:0$time';
            percentage -= (1 / allTime) / 1;
          });
        } else {
          // Para o cronômetro
          timer.cancel();
          estado = resting;
          allTime = 30;
          percentage = 1.0;
          setState(() {
            colorButton2 = primaryColor;
            cronometro = Strings.title;
            tarefa = Strings.assignment;
            textoBot = Strings.textButton;
            colorCircle = primarycolorButton;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    assignmentController.dispose();
    super.dispose();
  }
}

enum pomodoState {
  none,
  work,
  rest,
}
