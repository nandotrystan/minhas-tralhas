import 'package:desafio_cotacao_moedas/resources/colors_theme.dart';
import 'package:desafio_cotacao_moedas/resources/strings.dart';
import 'package:flutter/material.dart';

class PageCoin extends StatefulWidget {
  PageCoin({Key? key, required this.controller}) : super(key: key);

  final color = ColorsThemeCoin();
  PageController controller;

  @override
  State<PageCoin> createState() => _PageCoinState();
}

class _PageCoinState extends State<PageCoin> {
  final tabela = Strings().moedas;
  final page = 0;

  void onPressed(indexx, page) {
    //pageController.jumpToPage(index - page);
    setState(() {
      if (indexx == 0) {
        page = -1;
      } else {
        page = indexx - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Text(
            Strings.title1,
            style: TextStyle(
                color: widget.color.colorBlue,
                fontSize: 24,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            Strings.text1Page1,
            textAlign: TextAlign.center,
            style:
                TextStyle(fontSize: 14, color: widget.color.colorSecondaryText),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: tabela.length,
                itemBuilder: (context, indexx) {
                  final coin = tabela;
                  return
                      // child: MaterialButton(
                      //   color: widget.color.colorBackgroundList,
                      //   onPressed: () {
                      //     onItempressed(indexx, page);
                      //   },
                      Card(
                    margin: const EdgeInsets.all(6),
                    color: widget.color.colorBackgroundList,
                    child: ListTile(
                      onTap: (() {
                        onPressed(indexx, page);
                      }),
                      title: Text(
                        coin[indexx],
                        style: TextStyle(
                            fontSize: 12, color: widget.color.colorTextList),
                      ),
                      leading: Icon(
                        Icons.attach_money,
                        color: widget.color.colorTextList,
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
  }
}
