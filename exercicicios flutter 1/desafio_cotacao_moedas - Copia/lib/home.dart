import 'package:desafio_cotacao_moedas/controles.dart';
import 'package:desafio_cotacao_moedas/pages/page_base_coin.dart';
import 'package:desafio_cotacao_moedas/pages/page_price.dart';
import 'package:desafio_cotacao_moedas/pages/page_result.dart';
import 'package:desafio_cotacao_moedas/resources/colors_theme.dart';
import 'package:desafio_cotacao_moedas/widgets/balls.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  final color = ColorsThemeCoin();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CounterModel counterModel = CounterModel();
  PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: Controles.controle.pagina,
        builder: (context, valor, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                backgroundColor: widget.color.colorBackground,
                body: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: PageView(
                        controller: pageController,
                        onPageChanged: (index) {
                          setState(() {
                            counterModel.page(index);
                          });
                        },
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          PageCoin(
                            pageController: pageController,
                          ),
                          PagePrice(pageController: pageController),
                          PageResult(pageController: pageController),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ...List.generate(
                                3,
                                (index) => Ball(
                                    isActive: index == counterModel.currentPage
                                        ? true
                                        : false))
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ));
        });
  }
}
