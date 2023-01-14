import 'package:coins_coins/resources/colors_theme.dart';
import 'package:coins_coins/resources/strings.dart';
import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  Page3({ Key? key, required this.pageController}) : super(key: key);

  PageController pageController;
  final color = ColorsThemeCoin();

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
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
        return FutureBuilder(
         // future: CoinApiClient().fetch(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Text(
                          Strings.title3,
                          style: TextStyle(
                              color: widget.color.colorBlue,
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(
                                    text: Strings.text1Page3,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: widget.color.colorSecondaryText),
                                    children: [
                                      TextSpan(
                                        text: '',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color:
                                                widget.color.colorSecondaryText,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ]),
                              ),
                            ]),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: 2,
                              itemBuilder: (context, indexx) {
                                //final coin = ;
                                return Container(
                                    color: widget.color.colorBackgroundList,
                                    margin: const EdgeInsets.all(6),
                                    child: ListTile(
                                        onTap: () {
                                          
                                        },
                                        title: Text(
                                          'coin.nome',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color:
                                                  widget.color.colorTextList),
                                        ),
                                        leading: Icon(
                                          Icons.attach_money,
                                          color: widget.color.colorTextList,
                                        ),
                                        trailing: Text(
                                          '',
                                          // style: TextStyle(
                                          //   color: 
                                          //   ),
                                          ),
                                        ));
                              }),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                child: const Text(Strings.concluir),
                                onPressed: (() {
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
      }

  
}