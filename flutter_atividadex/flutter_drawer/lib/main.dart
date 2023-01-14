import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: TemaDrawer.light,
      darkTheme: TemaDrawer.dark,
      themeMode: ThemeMode.light,
      home: const MyAppDrawer(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyAppDrawer extends StatefulWidget {
  const MyAppDrawer({Key? key}) : super(key: key);

  @override
  State<MyAppDrawer> createState() => _MyAppDrawerState();
}

class _MyAppDrawerState extends State<MyAppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      endDrawer: Drawer(
        
        child: ListView(
          children: const <Widget>[
            MyIcon(
                icone: Icons.flash_on,
                texto: 'Flutter',
                subtitulo: 'Tudo são Widgets',
                cor: Colors.blue),
            MyIcon(
                icone: Icons.mood,
                texto: 'Dart',
                subtitulo: 'É muito forte',
                cor: Colors.red,),
            MyIcon(
                icone: Icons.coffee,
                texto: 'Cafessineo',
                subtitulo: 'Quero cafééé',
                cor: Colors.brown),
          ],
        ),
      ),
      appBar: AppBar(
        
        iconTheme: IconThemeData(color: Colors.pink.shade100, size: 40),
        title: Text(
          'Menu Drawer',
          style: TextStyle(color: Colors.pink.shade100, fontSize: 32.0),
        ),
      ),
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
      trailing: const Icon(Icons.keyboard_arrow_right),
    );
  }
}

class TemaDrawer {
  static final ThemeData light =
      ThemeData(brightness: Brightness.light, primarySwatch: Colors.pink);

  static final ThemeData dark =
      ThemeData(brightness: Brightness.dark, primarySwatch: Colors.yellow);
}
