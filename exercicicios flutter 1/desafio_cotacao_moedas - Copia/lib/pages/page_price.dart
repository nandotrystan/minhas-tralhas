import 'package:desafio_cotacao_moedas/controles.dart';
import 'package:desafio_cotacao_moedas/resources/colors_theme.dart';
import 'package:desafio_cotacao_moedas/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PagePrice extends StatefulWidget {
  PagePrice({Key? key, required this.pageController}) : super(key: key);

  final color = ColorsThemeCoin();
  PageController pageController;

  @override
  State<PagePrice> createState() => _PagePriceState();
}

class _PagePriceState extends State<PagePrice> {
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

  void caixa(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(Strings.msg),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('Ok'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: Controles.controle.pagina,
      builder: (context, valor, child) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Strings.title2,
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                        color: widget.color.colorBlue,
                        fontSize: 24,
                        fontWeight: FontWeight.w700)),
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: Strings.text1Page2,
                    style: TextStyle(
                        fontSize: 18, color: widget.color.colorSecondaryText),
                    children: [
                      TextSpan(
                        text: Controles.controle.nome,
                        style: TextStyle(
                            fontSize: 18,
                            color: widget.color.colorSecondaryText,
                            fontWeight: FontWeight.w700),
                      ),
                    ]),
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
                            setClicado(clicados, indexx);
                            escolherMoedas(clicados, indexx);
                            Controles.controle.setClicado(
                                Controles.controle.clicados, indexx);
                            Controles.controle.escolherMoedas(
                                Controles.controle.clicados, indexx);
                          },
                          title: Text(
                            coin.nome,
                            style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  color: indexx == setClicado(clicados, indexx)
                                      ? widget.color.colorBlue
                                      : widget.color.colorTextList),
                            ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        
                        setState(() {
                          if (clicados.isEmpty) {
                            caixa(context);
                          } else {
                            Controles.controle.gerar();
                            widget.pageController.jumpToPage(2);
                          }
                        });
                      },
                      child: const Text(Strings.next)),
                ],
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        );
      },
    );
  }
}
