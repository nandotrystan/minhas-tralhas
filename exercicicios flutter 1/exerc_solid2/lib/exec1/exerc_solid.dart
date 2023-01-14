
import 'package:exerc_solid/exec1/repository.dart';
import 'package:exerc_solid/exec2/i_repository.dart';
import 'package:exerc_solid/exec2/repository_dio.dart';

void main() async {
  
  final cep = '46750000';

  IRepository myApi = RepositoryDio();
  // IRepository myApi = Repository();

  final json = await myApi.fetch(cep);
  

  print(json.cep);
  print(json.city);
  
  
}
