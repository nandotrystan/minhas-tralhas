import '../compra.dart';
import 'i_tabela_desconto.dart';

class TabelaDesconto implements ITabelaDesconto {
  @override
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

}