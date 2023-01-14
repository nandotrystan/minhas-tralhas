import 'package:aula_solid/palio.dart';

import 'i_car.dart';

void main(List<String> args) {
  ICar? carro = Palio();
  print('marca do carro: ${carro.marca!}');

  final gastoTotal = carro.dirigir();
  print('gasto total: $gastoTotal');
  final abastecer = carro.abastecer();
  print('valor para abastecer $abastecer');
}
