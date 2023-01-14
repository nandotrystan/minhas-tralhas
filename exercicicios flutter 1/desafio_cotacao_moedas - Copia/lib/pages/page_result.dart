import 'package:desafio_cotacao_moedas/clients/coin_api_client.dart';
import 'package:desafio_cotacao_moedas/controles.dart';
import 'package:desafio_cotacao_moedas/resources/colors_theme.dart';
import 'package:desafio_cotacao_moedas/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageResult extends StatefulWidget {
  PageResult({Key? key, required this.pageController}) : super(key: key);

  final color = ColorsThemeCoin();
  PageController pageController;

  @override
  State<PageResult> createState() => _PageResultState();
}

class _PageResultState extends State<PageResult> {
  final CounterModel counterModel = CounterModel();
  changeColor(double parse) {
    if (parse < 1) {
      return widget.color.colorPriceGreen;
    } else if (parse >= 5) {
      return widget.color.colorPriceRed;
    } else {
      return widget.color.colorPriceYellow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: Controles.controle.pagina,
      builder: (context, valor, child) {
        return FutureBuilder(
          future: CoinApiClient().fetch(Controles.controle.conversao),
          builder: (context, snapshot) {
            if (snapshot.hasError) ;
            return snapshot.hasData
                ? Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Strings.title3,
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
                                    text: Strings.text1Page3,
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                      color: widget.color.colorSecondaryText,
                                      fontSize: 14,
                                    )),
                                    children: [
                                      TextSpan(
                                        text: Controles.controle.nome,
                                        style: GoogleFonts.openSans(
                                            textStyle: TextStyle(
                                                color: widget
                                                    .color.colorSecondaryText,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700)),
                                      ),
                                    ]),
                              ),
                            
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: Controles.controle.clicados.length,
                              itemBuilder: (context, indexx) {
                                final coin =
                                    Controles.controle.clicados[indexx];
                                return Container(
                                  color: widget.color.colorBackgroundList,
                                  margin: const EdgeInsets.all(6),
                                  child: ListTile(
                                    onTap: () {
                                      Controles.controle.mudarPagina3(0);
                                    },
                                    title: Text(
                                      coin.nome,
                                      style: GoogleFonts.openSans(
                                          textStyle: TextStyle(
                                              color: widget.color.colorTextList,
                                              fontSize: 18,)),
                                    ),
                                    leading: Icon(
                                      Icons.attach_money,
                                      color: widget.color.colorTextList,
                                    ),
                                    trailing: Text(
                                      Controles.controle.bids[indexx],
                                      style: GoogleFonts.openSans(textStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: changeColor(
                                          double.parse(
                                              Controles.controle.bids[indexx]),
                                        ),),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                child: const Text(Strings.concluir),
                                onPressed: (() {
                                  Controles.controle.mudarPagina3(0);
                                  widget.pageController.jumpToPage(0);
                                })),
                          ],
                        ),
                        const SizedBox(
                          height: 100,
                        )
                      ],
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
        );
      },
    );
  }
}
