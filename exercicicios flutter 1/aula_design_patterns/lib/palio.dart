import 'package:aula_solid/i_car.dart';

class Palio implements ICar {
  @override
  var chassis;

  @override
  String? marca = 'Fiat';

  @override
  var portas;

  @override
  var rodas;

  @override
  var volante;

  @override
  double abastecer() {
    return 200;
  }

  @override
  double dirigir() {
    return 2.0;
  }
}
