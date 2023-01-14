import 'package:flutter/material.dart';

void main() {
  runApp(const CardNFT());
}

class CardNFT extends StatefulWidget {
  const CardNFT({Key? key}) : super(key: key);

  @override
  State<CardNFT> createState() => _CardNFTState();
}

class _CardNFTState extends State<CardNFT> {
  ThemeMode currentThemeMode = ThemeMode.light;

  void mudarThemeMode() {
    setState(() {
      currentThemeMode = currentThemeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: currentThemeMode,
      theme: ThemeNFT.light,
      darkTheme: ThemeNFT.dark,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  color: const Color.fromARGB(255, 9, 57, 95),
                  elevation: 15,

                  // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(100)),
                  child: ClipRRect(
                    child: Image.network('https://i.imgur.com/w39qzaq.png',
                        fit: BoxFit.cover),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Equillibrium #3429',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 25, color: Colors.blueAccent),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Nossa coleção Equillibrium promove calma e balanço',
                style: TextStyle(
                  color: Colors.blue.shade100,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '0.041 ETH',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 20, color: Colors.blueAccent),
                    ),
                    // Expanded(child: SizedBox()),

                    Row(
                      children: const [
                        Icon(
                          Icons.access_alarm,
                          color: Colors.blueGrey,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'restam 3 dias',
                          style: TextStyle(
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 20,
                decoration: const BoxDecoration(
                    border: BorderDirectional(
                        bottom: BorderSide(color: Colors.blueGrey))),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  ClipRRect(
                    child: Image.network(
                      'https://scontent.fvdc3-1.fna.fbcdn.net/v/t1.6435-9/48189744_1995570403812813_8914965562203832320_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=174925&_nc_ohc=YZ6QCBn2oZkAX_w-Bix&tn=gFopoHAhU80EhWgs&_nc_ht=scontent.fvdc3-1.fna&oh=00_AT-59P0XqAiV73PFTx65tnv6MuP7xLYJip0uhhNBQhYCsg&oe=6231AD39',
                      height: 60,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Criado por ',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  const Text(
                    'TrystanMerak',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ThemeNFT {
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: const Color.fromARGB(255, 9, 57, 95),
  );

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: const Color.fromARGB(255, 18, 4, 92),
  );
}
