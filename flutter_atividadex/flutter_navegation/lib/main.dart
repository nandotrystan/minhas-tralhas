import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: TemaNavigation.light,
      darkTheme: TemaNavigation.dark,
      themeMode: ThemeMode.light,
      home: const MyAppNav(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyAppNav extends StatefulWidget {
  const MyAppNav({Key? key}) : super(key: key);

  @override
  State<MyAppNav> createState() => _MyAppNavState();
}

class _MyAppNavState extends State<MyAppNav> {
  int currentIndex = 0;

  void onItempressed(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          children: const <Widget>[
            MyIcon(
                icone: Icons.accessible,
                texto: 'Acredite',
                subtitulo: 'Tudo é possível',
                cor: Colors.blue),
            MyIcon(
              icone: Icons.abc,
              texto: 'Atenção',
              subtitulo: 'Vamos que vamos',
              cor: Colors.pink,
            ),
            MyIcon(
                icone: Icons.roller_skating,
                texto: 'Aventura',
                subtitulo: 'O silêncio é o mais alto dos sons',
                cor: Colors.redAccent),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.pink.shade100),
        title: Text(
          'Meu App',
          style: TextStyle(color: Colors.pink.shade100, fontSize: 32.0),
        ),
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: onItempressed,
          backgroundColor: Colors.grey.shade300,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
              tooltip: 'Home',
            ),
            BottomNavigationBarItem(
              label: 'Configugações',
              icon: Icon(Icons.settings),
              tooltip: 'Configurações',
            ),
            BottomNavigationBarItem(
              
              label: 'Login',
              icon: Icon(Icons.login),
              tooltip: 'Login',
            ),
          ]),
    );
  }
}

class MyIcon extends StatelessWidget {
  const MyIcon(
      {Key? key,
      required this.icone,
      required this.texto,
      required this.subtitulo,
      this.cor = Colors.black})
      : super(key: key);

  final IconData icone;
  final String texto;
  final String subtitulo;
  final Color cor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icone),
      title: Text(texto),
      subtitle: Text(subtitulo),
      iconColor: cor,
      trailing: const Icon(Icons.more_vert),
    );
  }
}

class TemaNavigation {
  static final ThemeData light =
      ThemeData(brightness: Brightness.light, primarySwatch: Colors.pink);

  static final ThemeData dark =
      ThemeData(brightness: Brightness.dark, primarySwatch: Colors.yellow);
}
