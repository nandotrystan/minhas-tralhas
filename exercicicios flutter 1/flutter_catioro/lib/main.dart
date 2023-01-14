import 'package:flutter/material.dart';
import 'package:flutter_catioro/Imagens.dart';
import 'package:flutter_catioro/animais.dart';
import 'package:flutter_catioro/nomes.dart';

void main() {
  runApp(const CatiorosList());
}

class CatiorosList extends StatelessWidget {
  const CatiorosList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cachorros = [
    Animais(nome: Nomes.dachshund, imagem: Fotos.dachshundFoto),
    Animais(nome: Nomes.golden, imagem: Fotos.goldenFoto),
    Animais(nome: Nomes.bulldog, imagem: Fotos.bulldogFoto),
    Animais(nome: Nomes.pug, imagem: Fotos.pugFoto),
    Animais(nome: Nomes.spaniel, imagem: Fotos.spanielFoto),
    Animais(nome: Nomes.husky, imagem: Fotos.huskyFoto),
    Animais(nome: Nomes.borderCollie, imagem: Fotos.borderCollieFoto),
    Animais(nome: Nomes.beagle, imagem: Fotos.beagleFoto),
    Animais(nome: Nomes.weimaraner, imagem: Fotos.weimaranerFoto),
    Animais(nome: Nomes.dalmata, imagem: Fotos.dalmataFoto),

    ];
    return MaterialApp(
      home: DefaultTabController(
        length: cachorros.length,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('CATIOROS', 
            style: TextStyle(
              fontSize: 32),
              ),
              backgroundColor: Colors.purpleAccent,
        bottom: TabBar(
          indicatorColor: Colors.black,
          isScrollable: true,
          tabs: [
            for (final cachorro in cachorros)
            Tab(child: 
            Text(cachorro.nome),
            ),
          ],
        ),
        ),
        body: TabBarView(children: [
          for (final cachorro in cachorros)
          Center(
            child: Image.network(cachorro.imagem),
          ),
          ],
          ),
        ),
        ),
    );
  }
}
