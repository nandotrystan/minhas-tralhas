import 'compra.dart';
import 'quebradas/frete.dart';
import 'quebradas/i_frete.dart';
import 'quebradas/i_tabela_desconto.dart';
import 'quebradas/tabela_desconto.dart';

class CalculadoraDePrecos {
  // double calcula(Compra compra) {
  //   // define o desconto
  //   var desconto = 0.0;
  //   if (compra.valor > 5000) {
  //     desconto = 0.03;
  //   }
  //   if (compra.valor > 10000) {
  //     desconto = 0.05;
  //   }

  //   // define o valor do frete
  //   var valorFrete = 0.0;
  //   switch (compra.cidade) {
  //     case Cidades.feiraDeSantana:
  //     case Cidades.salvador:
  //     case Cidades.santoAmaro:
  //       valorFrete = 0.0;
  //       break;
  //     case Cidades.saoPaulo:
  //     case Cidades.rioDeJaneiro:
  //       valorFrete = 15.0;
  //   }

  // calcula o preco da compra

  final IFrete frete;
  final ITabelaDesconto desconto;

  CalculadoraDePrecos(this.frete, this.desconto);
  double calcularValor(Compra compra) {
    return compra.valor * (1 - desconto.valorDesconto(compra)) +
        frete.valorFrete(compra);
  }
}
