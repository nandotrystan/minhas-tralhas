import 'package:desafio_cotacao_moedas/resources/colors_theme.dart';
import 'package:flutter/material.dart';

class Ball extends StatelessWidget {
  Ball({
    Key? key,
    required this.isActive,
    
  }) : super(key: key);

  final bool isActive;
  final color = ColorsThemeCoin();
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isActive ? color.colorBlue : color.colorPageBall,
        ),
      ),
    );
  }
}
