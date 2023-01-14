
import 'package:exerc_solid/exec1/repository.dart';

void main() async {
  
  final cep = '46750000';

  final myApi = Repository();
  final json = await myApi.fetch(cep);
  

  print(json.cep);
  print(json.city);
  
  
}
