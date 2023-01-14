import 'dart:convert';

import 'package:dindin/dtos/model_token.dart';
import 'package:dindin/dtos/model_user.dart';
import 'package:dindin/i_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class Repository implements IRepository {
  final storage = const FlutterSecureStorage();
  @override
  Future<void> login({required String email, required String password}) async {
    final _baseUrl = Uri.parse('https://authapi.pretodev.repl.co/login');
    
    final response = await http.post(_baseUrl,
        body: jsonEncode({'email': email, 'password': password}),
        headers: {'content-type': 'application/json'});

    print(response);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      print(json);
      final token = json['data']['token'];
      await storage.write(key: 'token', value: token);
    } else {
      throw Exception('Usuário não encontrado');
    }
  }

  @override
  Future<User> fetchInfo() async {
    final token = await storage.read(key: 'token');
    if (token == null) {
      throw Exception('Não há Token, faça o login antes');
    }
    final _baseUrl = Uri.parse('https://authapi.pretodev.repl.co/users/infos');
    final response =
        await http.get(_baseUrl, headers: {'Authorization': token});

    var json = jsonDecode(response.body) as Map<String, dynamic>;
    return User.fromJson(json);
  }

  @override
  Future<bool> hasUser() {
    return storage.containsKey(key: 'token');
  }

  @override
  Future<void> logout() {
    return storage.delete(key: 'token');
  }

  Future<void> login2(
    String email,
    String password,
  ) async {
    final url = Uri.parse('https://authapi.pretodev.repl.co/login');
    final response = await http.post(
      url,
      body: {
        'email': email,
        'password': password,
      },
      headers: {'content-type': 'application/json'},
    );

    if (response.statusCode > 400) {
      throw Exception('Credenciais incorretas');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final token = json['data']['token'];
    await storage.write(key: 'token', value: token);
  }
}

class UserRepository {
  final _storage = const FlutterSecureStorage();

  Future<void> login({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('https://authapi.pretodev.repl.co/login');
    final response = await http.post(
      url,
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
      headers: {'content-type': 'application/json'},
    );

    if (response.statusCode > 400) {
      throw Exception('Credenciais incorretas');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final token = json['data']['token'];
    await _storage.write(key: 'token', value: token);
  }

  Future<User> getInfos() async {
    final token = await _storage.read(key: 'token');
    print(token);
    final url = Uri.parse('https://authapi.pretodev.repl.co/users/infos');
    final response = await http.get(
      url,
      headers: {'Authorization': token ?? ''},
    );
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return User.fromJson(json);
  }

  Future<bool> hasUser() {
    return _storage.containsKey(key: 'token');
  }

  Future<void> logout() {
    return _storage.delete(key: 'token');
  }
}
