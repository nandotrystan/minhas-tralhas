import 'package:dado_magico/cores.dart';
import 'package:flutter/cupertino.dart';

enum DadosOption { one, two, three, four, five, six }

extension DadosOptionExtension on DadosOption {
  Color get color {
    switch (this) {
      case DadosOption.one:
        return CoresDados.rosa;
      
      case DadosOption.two:
        return CoresDados.azul;
      
      case DadosOption.three:
        return CoresDados.vermelho;
      
      case DadosOption.four:
        return CoresDados.verde;
        
      case DadosOption.five:
        return CoresDados.roxo;
        
      case DadosOption.six:
        return CoresDados.preto;
        
    }
  }
}

extension DadosContainerExtension on DadosOption {
  Color get backColor {
    switch (this) {
      case DadosOption.one:
        return CoresDados.container1;
      
      case DadosOption.two:
        return CoresDados.container2;
      
      case DadosOption.three:
        return CoresDados.container3;
      
      case DadosOption.four:
        return CoresDados.container4;
        
      case DadosOption.five:
        return CoresDados.container5;
        
      case DadosOption.six:
        return CoresDados.container6;
        
    }
  }
}

extension DadosOptionIntExtension on DadosOption {
  double get tamanhoFont {
    switch (this) {
      case DadosOption.one:
        return 25;
      
      case DadosOption.two:
        return 30;
      
      case DadosOption.three:
        return 35;
      
      case DadosOption.four:
        return 40;
        
      case DadosOption.five:
        return 45;
        
      case DadosOption.six:
        return 50;
        
    }
  }
}
