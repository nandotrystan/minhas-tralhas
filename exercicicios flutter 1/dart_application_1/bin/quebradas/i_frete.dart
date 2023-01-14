import '../cidades.dart';
import '../compra.dart';

abstract class IFrete {
  double valorFrete(Compra compra);
}
