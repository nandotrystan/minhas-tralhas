import 'package:desafio_cotacao_moedas/clients/coin_api_client.dart';
import 'package:desafio_cotacao_moedas/resources/strings.dart';
import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  var value = 0;
  var currentPage = 0;

  void increment() {
    value++;

    notifyListeners();
  }

  void page(int value) {
    currentPage = value;

    notifyListeners();
  }
}

class Controles {
  static final Controles controle = Controles._();
  Controles._();

  final pagina = ValueNotifier<int>(0);
  final listaCoins = Strings().coins;

  final listaVoltar = Strings().coins;
  var codein = '';
  var bid = '';
  var nome = '';

  final List<dynamic> clicados = [];
  final tempList = [];
  final bids = [];
  final bidss = [];
  int count = 0;
  String conversao = '';

  int setClicado(List clicados, int indexx) {
    return clicados.contains(listaCoins[indexx]) ? indexx : -1;
  }

  void escolherMoedas(clicados, indexx) {
    indexx == setClicado(clicados, indexx)
        ? clicados.remove(listaCoins[indexx])
        : clicados.add(listaCoins[indexx]);
    count = clicados.length;
  }

  mudarPage1(indexx, pagina) {
    pagina = 1;
    codein = listaCoins[indexx].code;
    print(codein);
    nome = listaCoins[indexx].nome;
    print(nome);
    listaCoins.removeAt(indexx);
  }

  mudarPage2(indexx) {
    listaCoins.addAll(clicados);
  }

  mudarPagina2(pagina) {
    pagina = 2;
  }

  mudarPagina3(pagina) {
    pagina = 0;
    listaCoins.clear();
    listaCoins.addAll(Strings().coins);
    clicados.clear();
    codein = '';
    nome = '';
    bids.clear();
    bidss.clear();
    count = 0;
    conversao = '';
  }

  Future<void> gerar() async {
    final myApi = CoinApiClient();
    for (int i = 0; i < clicados.length; i++) {
      if (i < clicados.length - 1) {
        conversao += '${clicados[i].code}-$codein,';
        print(conversao);
      } else {
        conversao += '${clicados[i].code}-$codein';
        print(conversao);
      }
      print(conversao);
    }
    final jsson = await myApi.fetch(conversao);
    for (final i in clicados) {
      bid = await jsson[i.code]['bid'];
      bids.add(bid);
    }
  }
}
