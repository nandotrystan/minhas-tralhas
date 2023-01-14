import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'strings.dart';

class Metodos {
  static const mWords = 'Quantas Palavras?';
  static const start = 'Start Game';
  static const send = 'Enviar';
  static const initMsg =
      'Clique em Start Game, digite a palavra mostrada e clique em Enviar';
  TextEditingController wordController = TextEditingController();
  String randomWord = '';
  int point = 0;
  int tempo = 30;
  bool gameOn = false;
  String msg = Strings.mWords;

  List<String> listWords = [
  'Lorem',
  'ipsum', 
  'dolor', 
  'sit', 
  'amet', 
  'consectetur', 
  'adipiscing', 
  'elit', 
  'Nullam', 
  'nulla', 
  'nisi', 
  'pulvinar', 
  'quis', 
  'condimentum' 
  'eget', 
  'ultricies', 
  'anicyu', 
  'nunceru', 
  'Morbi', 
  'sapien',
];

      
    void letsGo(BuildContext context) {
    if (!gameOn) {
      randomWord = drawWord(context);
      point = 0;
      tempo = 30;
      gameOn = true;

      Timer.periodic(const Duration(seconds: 1), (timer) {
        
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
        
          point++;
        
      }
      wordController.text = '';
      drawWord(context);
    }
  }
}