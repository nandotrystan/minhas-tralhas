import 'package:flutter/material.dart';

void main() {
  runApp(const DarkMode());
}


class DarkMode extends StatefulWidget {
  const DarkMode({Key? key}) : super(key: key);

  @override
  _DarkModeState createState() => _DarkModeState();
}

class _DarkModeState extends State<DarkMode> {
  Color cor1 = const Color(0xFF232323);
  Color cor2 = const Color(0xFF1B446B);
  Color cor3 = const Color(0x55214B72);
  Color cor4 = const Color(0x9935638F);
  Color cor5 = const Color(0x99F9F9F9);
  int selecionado = -1;
  bool darkMode = true;
  List icones = [
    Icons.lightbulb_outline_rounded,
    Icons.thermostat_rounded,
    Icons.water,
    Icons.security_rounded,
    Icons.wifi_rounded,
    Icons.tv_rounded,
  ];
  List funcoes = [
    "luzes",
    "temperatura",
    "lavadora",
    "segurança",
    "wifi",
    "televisor",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                cor1,
                cor2,
              ],
            ),
          ),
          child: ListView(
            children: [
              //Logotipo
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.home_outlined,
                    color: cor5,
                    size: 64,
                  ),
                  Column(
                    children: [
                      //Titulo
                      Center(
                        child: Text(
                          "SWEET HOME",
                          style: TextStyle(
                              fontSize: 32,
                              letterSpacing: 2,
                              color: cor5,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none),
                        ),
                      ),
                      //Subtitulo
                      Center(
                        child: Text(
                          "O que gostaria de monitorar?",
                          style: TextStyle(
                              fontSize: 16,
                              color: cor5,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
      
              GridView.count(
                //Permite compartilhar o espaço
                shrinkWrap: true,
                //Cria o grid com duas colunas
                crossAxisCount: 2,
      
                childAspectRatio: 1.35,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
      
                //Gera 30 itens que exibem os dias do mês
                children: List.generate(
                  6,
                  (index) {
                    //Detector de movimento
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          //Verifica se está selecionado
                          selecionado = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        padding: const EdgeInsets.all(10),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: index == selecionado ? cor4 : cor3,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              icones[index],
                              color: cor5,
                              size: 48,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              funcoes[index],
                              style: TextStyle(
                                  fontSize: 18,
                                  letterSpacing: 2,
                                  color: cor5,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      //Indica o modo que pode ser ativado
                      darkMode ? "Light Mode" : "Dark Mode",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        color: cor5,
                      ),
                    ),
                    Switch(
                      activeColor: cor3,
                      value: darkMode,
                      onChanged: (value) {
                        setState(() {
                          //Estabelece as cores para cada modo
                          if (darkMode) {
                            cor5 = const Color(0xFF1B446B);
                            cor4 = const Color(0x55F9F9F9);
                            cor3 = const Color(0x55214B72);
                            cor2 = const Color(0xFFc9c9c9);
                            cor1 = const Color(0x5535638F);
                            darkMode = false;
                          } else {
                            cor1 = const Color(0xFF232323);
                            cor1 = const Color(0xFF1B446B);
                            cor1 = const Color(0x55214B72);
                            cor1 = const Color(0x9935638F);
                            cor1 = const Color(0x99F9F9F9);
                            darkMode = true;
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

