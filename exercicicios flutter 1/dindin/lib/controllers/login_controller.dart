import 'package:dindin/dtos/dio.dart';
import 'package:dindin/i_repository.dart';
import 'package:dindin/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginController extends ChangeNotifier {
  static final LoginController controle = LoginController._();
  LoginController._();

  // final CustomDio customDio;

  // LoginController(this.customDio);

  int page = 0;
  late final email = TextEditingController();
  String name = '';
  double ballance = 0;
  late final password = TextEditingController();
  String? token;
  final storage = const FlutterSecureStorage();
  final repository = Repository();
  bool loading = false;
  final emailRegex = RegExp(
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");

  somar() {
    page++;
    notifyListeners();
  }

  String? passwordValidator(password) {
    final emptyError = emptyValidator(password);
    if (emptyError == null && password != null) {
      if (password.length < 6) {
        return 'Senha inválida';
      }
    }
    return emptyError;
  }

  String? emailValidator(email) {
    final emptyError = emptyValidator(email);
    if (emptyError == null && email != null) {
      if (emailRegex.hasMatch(email)) {
        return 'E-mail inválido';
      }
    }
    return emptyError;
  }

  String? emptyValidator(String? text) {
    if (text == null || text.isEmpty) {
      return 'Dados errados';
    }
  }

  void changeLoadTrue() {
    loading = true;
  }

  void changeLoadFalse() {
    loading = false;
  }

  Future<void> submit(
      GlobalKey<FormState> formKey, BuildContext context) async {
    try {
      if (formKey.currentState?.validate() ?? false) {
        somar();
        formKey.currentState?.save();
        somar();
        changeLoadTrue();
        somar();
        await repository.login(email: email.text, password: password.text);
        somar();
        Navigator.of(context).popAndPushNamed('/home');
        somar();
      }
    } catch (error) {
      print(error);
      changeLoadFalse();
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text('E-mail ou senha inválidos'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text('X'))
          ],
        ),
      );
    }

    notifyListeners();
  }

  void loginUser(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 4));
    if (await repository.hasUser()) {
      Navigator.of(context).popAndPushNamed('/home');
    } else {
      Navigator.of(context).popAndPushNamed('/login');
    }
    notifyListeners();
  }

  void loadUser(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 4));
    if (await repository.hasUser()) {
      Navigator.of(context).popAndPushNamed('/home');
    } else {
      Navigator.of(context).popAndPushNamed('/login');
    }
    notifyListeners();
  }

  void loadInfos() async {
    loading = true;
    final user = await repository.fetchInfo();
    print(user);
    loading = false;
    name = user.name;
    ballance = double.parse(user.ballance.toStringAsFixed(2));
    notifyListeners();
  }

  void logout(BuildContext context) {
    repository.logout();
    Navigator.of(context).popAndPushNamed('/login');
    loading = false;
    email.clear;
    password.clear;

    notifyListeners();
  }
  // Future<bool> login() async {
  //   try {
  //     token = await getToken();
  //     if (token != null) {
  //       customDio.instance.options.headers['Authorization'] = token;
  //       return true;
  //     }
  //     final response = await customDio.instance
  //         .post('/login', data: {'email': email, 'password': password});

  //     if (response.statusCode == 200 && response.data['token'] != null) {
  //       token = response.data['token'];
  //       customDio.instance.options.headers['Authorization'] = token;

  //       await saveToken(token!);
  //       print(token);
  //       return true;
  //     }
  //     return false;
  //   } catch (error) {
  //     print(error);
  //     return false;
  //   }
  // }

  // Future<String?> getToken() async {
  //   return storage.read(key: 'token');
  // }

  // Future<void> saveToken(String value) async {
  //   await storage.write(key: 'token', value: value);
  // }
}
