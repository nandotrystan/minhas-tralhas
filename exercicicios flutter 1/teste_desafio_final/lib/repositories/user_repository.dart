import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:teste_desafio_final/dtos/model_address.dart';
import 'package:teste_desafio_final/dtos/model_contacts.dart';
import 'package:teste_desafio_final/dtos/model_user.dart';

class UserRepository {
  final storage = const FlutterSecureStorage();

  Future<void> register(
      {required String fullName,
      String? rg,
      required String cpf,
      required String email,
      required String password,
      String? profilePictureUrl,
      String? birthDate}) async {
    final _baseUrl = Uri.parse('https://cubos-las-api.herokuapp.com/user');

    final response = await http.post(_baseUrl,
        body: jsonEncode({
          'fullName': fullName,
          'rg': rg,
          'cpf': cpf,
          'email': email,
          'password': password,
          'profilePictureUrl': profilePictureUrl,
          'birthDate': birthDate
        }),
        headers: {'Content-Type': 'application/json; charset=utf-8'});
    print(response.body.toString());
  }

  Future<void> login({required String cpf, required String password}) async {
    final _baseUrl =
        Uri.parse('https://cubos-las-api.herokuapp.com/auth/login');
    final response = await http.post(_baseUrl,
        body: jsonEncode({'cpf': cpf, 'password': password}),
        headers: {'content-type': 'application/json; charset=utf-8'});

    //print(response.toString());

    if (response.statusCode == 201) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      //print(json);
      final _token = json['token'];
      await storage.write(key: 'token', value: _token);
      print(_token);
    } else {
      throw Exception('Usuário não encontrado');
    }
  }

  Future<void> updateUser(
      {required String fullName,
      String? rg,
      required String cpf,
      required String email,
      required String password,
      String? profilePictureUrl,
      String? birthDate}) async {
    final _baseUrl = Uri.parse('https://cubos-las-api.herokuapp.com/user');

    final _token = await storage.read(key: 'token');
    if (_token == null) {
      throw Exception('Não há Token, faça o login antes');
    } else {
      final response = await http.put(_baseUrl,
          body: jsonEncode({
            'fullName': fullName,
            'rg': rg,
            'cpf': cpf,
            'email': email,
            'password': password,
            'profilePictureUrl': profilePictureUrl,
            'birthDate': birthDate,
          }),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $_token',
          });
      print(response.body.toString());
    }
  }

  Future<User> fetchInfo() async {
    final _token = await storage.read(key: 'token');
    if (_token == null) {
      throw Exception('Não há Token, faça o login antes');
    }
    final _baseUrl = Uri.parse('https://cubos-las-api.herokuapp.com/user');
    final response =
        await http.get(_baseUrl, headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $_token',});

    var json = jsonDecode(response.body) as Map<String, dynamic>;
    print(json);
    return User.fromJson(json);
  }

  Future<ModelAdress> fetchInfoAdress() async {
    final _token = await storage.read(key: 'token');
    if (_token == null) {
      throw Exception('Não há Token, faça o login antes');
    }
    final _baseUrl = Uri.parse('https://cubos-las-api.herokuapp.com/user/address');
    final response =
        await http.get(_baseUrl, headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $_token',});

    var json = jsonDecode(response.body) as Map<String, dynamic>;
    print(json);
    return ModelAdress.fromJson(json);
  }

  Future<bool> hasUser() {
    return storage.containsKey(key: 'token');
  }

  Future<void> updateAdress(
      {required cep,
      required street,
      required number,
      required complement,
      required district,
      required city,
      required state}) async {
    final _baseUrl = Uri.parse('https://cubos-las-api.herokuapp.com/user/address');

    final _token = await storage.read(key: 'token');
    if (_token == null) {
      throw Exception('Não há Token, faça o login antes');
    } else {
      final response = await http.put(_baseUrl,
          body: jsonEncode({
            "cep": cep,
            "street": street,
            "number": number,
            "complement": complement,
            "district": district,
            "city": city,
            "state": state
                    }),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $_token',
          });
      print(response.body.toString());
    }
  }

  Future<ModelContacts> fetchInfoContacts() async {
    final _token = await storage.read(key: 'token');
    if (_token == null) {
      throw Exception('Não há Token, faça o login antes');
    }
    final _baseUrl = Uri.parse('https://cubos-las-api.herokuapp.com/user/contacts');
    final response =
        await http.get(_baseUrl, headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $_token',});

    var json = jsonDecode(response.body);
    print(json);
    return ModelContacts.fromJson(json);
  }

  Future<void> updateContacts(
      {required email, required phone, required mobilePhone}) async {
    final _baseUrl = Uri.parse('https://cubos-las-api.herokuapp.com/user/contacts');

    final _token = await storage.read(key: 'token');
    if (_token == null) {
      throw Exception('Não há Token, faça o login antes');
    } else {
      final response = await http.put(_baseUrl,
          body: jsonEncode({
            "email": email,
            "phone": phone,
            "mobilePhone": mobilePhone,
                    }),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $_token',
          });
      print(response.body.toString());
    }
  }

}
