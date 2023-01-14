import 'package:exerc_solid/exec1/dto.dart';
import 'package:exerc_solid/exec2/i_repository.dart';
import 'package:dio/dio.dart';

class RepositoryDio implements IRepository {
  @override
  Future fetch(String cep) async{
    try {
      var response = await Dio().get('https://brasilapi.com.br/api/cep/v2/$cep');
      //print(response);
     
      var json = Cep.fromJson(response.data);

      return json;
    } catch (error) {
      print(error);
    }

}
}