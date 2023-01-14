import 'cidades.dart';
import 'compra.dart';

abstract class ICalculadora {
  double valorDesconto(Compra compra) {
    var desconto = 0.0;
    if (compra.valor > 5000) {
      desconto = 0.03;
    }
    if (compra.valor > 10000) {
      desconto = 0.05;
    }
    return desconto;
  }

  double valorFrete(Compra compra) {
    var valorFrete = 0.0;
    switch (compra.cidade) {
      case Cidades.feiraDeSantana:
      case Cidades.salvador:
      case Cidades.santoAmaro:
        valorFrete = 0.0;
        break;
      case Cidades.saoPaulo:
      case Cidades.rioDeJaneiro:
        valorFrete = 15.0;
    }
    return valorFrete;
  }
 

  

    // calcula o preco da compra
    // return compra.valor * (1 - desconto) + valorFrete;
  
}
