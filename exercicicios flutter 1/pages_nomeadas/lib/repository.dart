import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pages_nomeadas/dto.dart';
class Repository {
  Future fetch(String cep) async {
    var url = Uri.parse('https://brasilapi.com.br/api/cep/v2/$cep');

    var response = await http.get(url);
    if (response.statusCode == 200 || response.body.isNotEmpty) {
      var json = jsonDecode(response.body);
      var jsson = Cep.fromJson(json);

      return jsson;
    }
  }
}