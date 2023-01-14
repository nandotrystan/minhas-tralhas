import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quantas_palavras/list_word.dart';
import 'package:quantas_palavras/strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController wordController = TextEditingController();
  String randomWord = '';
  int point = 0;
  int tempo = 30;
  bool gameOn = false;
  String msg = Strings.mWords;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
          toolbarHeight: 90,
          title: Text(
            msg,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  randomWord,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                TextField(
                  controller: wordController,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 20,
                ),
                Builder(builder: (context) {
                  return MaterialButton(
                    onPressed: () {
                      checkWord(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        Strings.send,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    color: Colors.purple,
                  );
                }),
                const SizedBox(
                  height: 20,
                ),
                Builder(builder: (context) {
                  return MaterialButton(
                    onPressed: () {
                      letsGo(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        Strings.start,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    color: Colors.purple,
                  );
                }),
                const SizedBox(
                  height: 20,
                ),
                Builder(builder: (context) {
                  return MaterialButton(
                    color: Colors.blueGrey,
                    child: const Text(
                      "?",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        // color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      showMsg(context, Strings.initMsg);
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void letsGo(BuildContext context) {
    if (!gameOn) {
      randomWord = drawWord(context);
      point = 0;
      tempo = 30;
      gameOn = true;

      Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          tempo--;
          if (tempo > 0) {
            msg = tempo > 9 ? '00:$tempo' : '00:0$tempo';
          } else {
            timer.cancel();
            msg = Strings.mWords;
            showMsg(context, 'Acertou $point palavra(s)');
            wordController.text = '';
            randomWord = '';
            gameOn = false;
          }
        });
      });
    }
  }

  String drawWord(BuildContext context) {
    Random aleatorio = Random();
    int listLength = listWords.length;
    int drawNumber = aleatorio.nextInt(listLength);
    String word = listWords[drawNumber];

    while (word == randomWord) {
      drawNumber = aleatorio.nextInt(listLength);
      word = listWords[drawNumber];
    }

    randomWord = word;

    return randomWord;
  }

  void showMsg(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: Text(
            message,
            style: const TextStyle(
              fontSize: 24,
            ),
          ));
        });
  }

  void checkWord(BuildContext context) {
    if (gameOn) {
      if (wordController.text == randomWord) {
        setState(() {
          point++;
        });
      }
      wordController.text = '';
      drawWord(context);
    }
  }

  @override
  void dispose() {
    wordController.dispose();
    super.dispose();
  }
}
