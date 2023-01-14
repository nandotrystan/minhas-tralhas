import 'package:dio/dio.dart';

class CustomDio {
  final Dio instance;
  CustomDio(this.instance) {
    instance.options.baseUrl = 'https://authapi.pretodev.repl.co';
    instance.options.connectTimeout = 5000; //5s
    instance.options.receiveTimeout = 3000;
  }
}
