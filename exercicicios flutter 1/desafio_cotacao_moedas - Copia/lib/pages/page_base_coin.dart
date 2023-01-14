import 'package:desafio_cotacao_moedas/controles.dart';

import 'package:desafio_cotacao_moedas/resources/colors_theme.dart';
import 'package:desafio_cotacao_moedas/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageCoin extends StatefulWidget {
  PageCoin({Key? key, required this.pageController}) : super(key: key);

  final color = ColorsThemeCoin();
  PageController pageController;

  @override
  State<PageCoin> createState() => _PageCoinState();
}

class _PageCoinState extends State<PageCoin> {
  //final tabela = Strings().moedas;
  final CounterModel counterModel = CounterModel();

  List clicados = [];

  int setClicado(List clicados, int indexx) {
    return clicados.contains(indexx) ? indexx : -1;
  }

  void escolherMoedas(clicados, indexx) {
    setState(() {
      indexx == setClicado(clicados, indexx)
          ? clicados.remove(indexx)
          : clicados.add(indexx);
    });
  }
 

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Controles.controle.pagina,
      builder: (context, valor, child) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Text(
                Strings.title1,
                style: 
                GoogleFonts.openSans(textStyle: TextStyle(
                  color: widget.color.colorBlue,
                    fontSize: 24,
                    fontWeight: FontWeight.w700
                )),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                Strings.text1Page1,
                textAlign: TextAlign.center,
                style: 
                  GoogleFonts.openSans(textStyle: TextStyle(
                  color: widget.color.colorSecondaryText,
                    fontSize: 18,
                )),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: Controles.controle.listaCoins.length,
                    itemBuilder: (context, indexx) {
                      final coin = Controles.controle.listaCoins[indexx];
                      return Container(
                        decoration: BoxDecoration(
                            color: widget.color.colorBackgroundList,
                            border: indexx == setClicado(clicados, indexx)
                                ? Border.all(color: widget.color.colorBlue)
                                : Border.all(color: Colors.transparent)),
                        margin: const EdgeInsets.all(6),
                        child: ListTile(
                          onTap: () {
                            widget.pageController.jumpToPage(1);
                            Controles.controle
                                .mudarPage1(indexx, Controles.controle.pagina);
                            setClicado(clicados, indexx);
                            escolherMoedas(clicados, indexx);
                          },
                          title: Text(
                            coin.nome,
                            style: GoogleFonts.openSans(textStyle: TextStyle(fontSize: 14,
                                color: indexx == setClicado(clicados, indexx)
                                    ? widget.color.colorBlue
                                    : widget.color.colorTextList),),
                          ),
                          leading: Icon(
                            Icons.attach_money,
                            color: indexx == setClicado(clicados, indexx)
                                ? widget.color.colorBlue
                                : widget.color.colorTextList,
                          ),
                        ),
                      );
                      //   ),
                      // );
                    }),
              ),
              

            ],
          ),
        );
      },
    );
  }
}
