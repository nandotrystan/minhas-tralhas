import 'dart:convert';

import 'package:desafio_cotacao_moedas/models/dtos/coin_converter_dto.dart';
import 'package:desafio_cotacao_moedas/models/dtos/coin_dto.dart';
import 'package:http/http.dart' as http;

class CoinListRequestFailure implements Exception {}

class CoinApiClient {
  static const _baseUrl = 'economia.awesomeapi.com.br/last';
  static const _basePath =
      'USD-BRL,EUR-BRL,GBP-BRL,JPY-BRL,ARS-BRL,CAD-BRL,BRL-USD,EUR-USD,GBP-USD,JPY-USD,ARS-USD,CAD-USD,BRL-EUR,USD-EUR,GBP-EUR,JPY-EUR,ARS-EUR,CAD-EUR,BRL-GBP,EUR-GBP,USD-GBP';
  static const _basePath2 = 'USD';
  CoinApiClient(this._httpClient);
  final http.Client _httpClient;

  Future<CoinListDto> getCoinList({required int offset}) async {
    final coinListUri = Uri.https(_baseUrl, '$_basePath', {'offset': offset.toString()});
    final coinListResponse = await _httpClient.get(coinListUri);

    if (coinListResponse.statusCode == 200 &&
        coinListResponse.body.isNotEmpty) {
      return CoinListDto.fromJson(jsonDecode(coinListResponse.body));
    }

    throw CoinListRequestFailure();
  }

  Future<CoinDto> getCoin() async {
    final coinUri = Uri.https(_baseUrl, '$_basePath2');
    final coinResponse = await _httpClient.get(coinUri);

    if (coinResponse.statusCode == 200 &&
        coinResponse.body.isNotEmpty) {
      return CoinDto.fromJson(jsonDecode(coinResponse.body));
    }

    throw CoinListRequestFailure();
  }
}
