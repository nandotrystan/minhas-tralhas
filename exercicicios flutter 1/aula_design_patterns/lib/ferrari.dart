import 'package:aula_solid/i_car.dart';

class Ferrari implements ICar {
  @override
  var chassis;

  @override
  String? marca = 'Ferrari';

  @override
  var portas;

  @override
  var rodas;

  @override
  var volante;

  @override
  double abastecer() {
    return 1000;
  }

  @override
  double dirigir() {
    return 1;
  }
}
