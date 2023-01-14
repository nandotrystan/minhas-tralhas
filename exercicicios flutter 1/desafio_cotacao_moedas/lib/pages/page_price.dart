import 'package:desafio_cotacao_moedas/resources/colors_theme.dart';
import 'package:desafio_cotacao_moedas/resources/strings.dart';
import 'package:desafio_cotacao_moedas/widgets/balls.dart';
import 'package:flutter/material.dart';

class PagePrice extends StatefulWidget {
  PagePrice({Key? key}) : super(key: key);

  final color = ColorsThemeCoin();

  @override
  State<PagePrice> createState() => _PagePriceState();
}

class _PagePriceState extends State<PagePrice> {
  var tempIndex = 1;
  List moedas = [
    Strings.real,
    Strings.dolarUS,
    Strings.euro,
    Strings.libra,
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
    );
  }
}
