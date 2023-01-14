// ignore_for_file: prefer_const_constructors



import 'package:flutter/material.dart';
import 'package:flutter_viagem/tabs.dart';

void main() {
  runApp(const QueViagem());
}

class QueViagem extends StatelessWidget {
  const QueViagem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color cor = Colors.black;

    final tabs = [
      TabsViagem('VOOS', Icons.flight_rounded),
      TabsViagem('PASSEIOS', Icons.shopping_bag),
      TabsViagem('MAPA', Icons.explore_rounded),
    ];

    return MaterialApp(
      home: DefaultTabController(
        length: tabs.length,
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'Que Viagem! Turismo',
                style: TextStyle(fontSize: 32, color: cor),
              ),
              backgroundColor: Colors.orange.shade900,
              bottom: TabBar(
                indicatorColor: cor,
                tabs: [
                  for (final tab in tabs)
                    Tab(
                      child: Text(
                        tab.aba,
                        style: const TextStyle(color: cor),
                      ),
                      icon: Icon(
                        tab.icone,
                        // color: cor,
                      ),
                    ),
                ],
              ),
            ),
            body: TabBarView(children: [voo(), passeio(), mapa()])),
      ),
    );
  }
}

Container voo() {
  return Container(
    padding: const EdgeInsets.all(40),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'PARTIDA',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 18,
        ),
        const Text('Abril 08, 2020'),
        const SizedBox(
          height: 35,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: const [
                Text(
                  'GRU',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 25),
                Text('Guarulhos, Brazil'),
              ],
            ),
            const RotatedBox(
              quarterTurns: 1,
              child: Icon(
                Icons.flight_rounded,
                size: 50,
              ),
            ),
            Column(
              children: const [
                Text(
                  'OPO',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 25),
                Text('Porto, Portugal'),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

ListView passeio() {
  return ListView(
    children: [
      Container(
        padding: const EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pontos turísticos do Porto',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Ponte Dom Luis I',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 5),
            Image.network(
                'https://cdn.pixabay.com/photo/2021/11/23/22/46/bridge-6819802_960_720.jpg'),
            SizedBox(height: 5),
            const Text(
              'A ponte de D. Luís I foi construida em 1886 pelo discípulo de Eiffel, Theophile Seyrig. Com dois andares e um impressionante arco de ferro, liga a parte do Porto com a sua vizinha Vila Nova de Gaia, onde se encontram as famosas adegas de vinho do Porto. Na parte superior da ponte, passa o eléctrico, enquanto que na inferior passam os carros e há passeios para os peões em ambos os andares. Desde o andar superior há umas vistas impressionantes do Douro, assim como uma bela panorâmica do rio. Na parte inferior há um café tranquilo com uma esplanada mesmo à beira do rio onde se podem desfrutar de umas Vistas e pores-do-sol estupendos.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Torre dos Clérigos',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 5),
            Image.network(
                'https://cdn.pixabay.com/photo/2016/10/12/21/23/clerigos-tower-1735981_960_720.jpg'),
            SizedBox(height: 5),
            const Text(
              'A Igreja e Torre dos Clérigos é um notável conjunto arquitetónico situado na cidade do Porto, Portugal, sendo considerado o cartão-postal dessa cidade. O conjunto localiza-se no topo da Rua dos Clérigos, entre as ruas de São Filipe Néri e da Assunção',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    ],
  );
}

Image mapa() {
  return Image.network(
      'https://cdn.pixabay.com/photo/2016/08/05/22/14/atlantic-ocean-1573399_960_720.jpg');
}
