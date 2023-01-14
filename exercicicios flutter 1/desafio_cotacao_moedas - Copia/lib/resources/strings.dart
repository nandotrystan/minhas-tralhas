import 'package:desafio_cotacao_moedas/models/code_codein.dart';
import 'package:desafio_cotacao_moedas/resources/enum.dart';

class Strings {
  static const String text1Page1 =
      'Selecione uma moeda base para as conversões';
  static const text1Page2 = 'Selecione as moedas serem cotadas em ';

  static const text1Page3 = 'Confira os valores de compra referentes ao ';

  static const dolarUS = 'Dólar Americano';
  static const String real = 'Real';
  static const String euro = 'Euro';
  static const String libra = 'Libra Esterlina';
  static const concluir = 'Concluir';
  static const next = 'Próximo';
  static const String bRL = 'BRL';
  static const String uSD = 'USD';
  static const String eUR = 'EUR';
  static const String gBP = 'GBP';
  static const String msg = 'Escolha no mínimo uma opção';

  static const title1 = 'Moeda base';
  static const title2 = 'Cotação';
  static const title3 = 'Resultado';

  List<dynamic> coins = [
    CodeCodeIn(
        nome: UseEnum.myCoins(SiglasCoin.bRL),
        code: SiglasCoin.bRL.name.toUpperCase(),
        codein: Strings.bRL),
    CodeCodeIn(
        nome: UseEnum.myCoins(SiglasCoin.uSD),
        code: SiglasCoin.uSD.name.toUpperCase(),
        codein: Strings.uSD),
    CodeCodeIn(
        nome: UseEnum.myCoins(SiglasCoin.eUR),
        code: SiglasCoin.eUR.name.toUpperCase(),
        codein: Strings.eUR),
    CodeCodeIn(
        nome: UseEnum.myCoins(SiglasCoin.gBP),
        code: SiglasCoin.gBP.name.toUpperCase(),
        codein: Strings.gBP),
  ];
}
