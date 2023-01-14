import '../cidades.dart';
import '../compra.dart';
import 'i_frete.dart';

class Frete implements IFrete {
  @override
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

}