import 'calculadora_de_precos.dart';
import 'cidades.dart';
import 'compra.dart';
import 'quebradas/frete.dart';
import 'quebradas/tabela_desconto.dart';

void main() {
  final frete = Frete();
  final desconto = TabelaDesconto();
  final calculadora = CalculadoraDePrecos(frete, desconto);

  final compra1 = Compra(
    codigoProduto: 1,
    valor: 5300.0,
    cidade: Cidades.salvador,
  );

  final precoCompra = calculadora.calcularValor(compra1);

  print('Valor da compra ficou $precoCompra');
}
