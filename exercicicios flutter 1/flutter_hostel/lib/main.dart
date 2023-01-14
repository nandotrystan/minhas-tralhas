

import 'package:flutter/material.dart';

void main() {
  runApp(const Hostel());
}

class Hostel extends StatefulWidget {
  const Hostel({Key? key}) : super(key: key);

  @override
  _HostelState createState() => _HostelState();
}

class _HostelState extends State<Hostel> {
  List clicados = [];

  int setClicado(List clicados, int index) {
    return clicados.contains(index) ? index : -1;
  }

  void escolherDias(clicados, index) {
    setState(() {
      index == setClicado(clicados, index)
          ? clicados.remove(index)
          : clicados.add(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 145, 20, 11),
          title: const Text(
            'ErBienBi - Hospedagens',
            style: TextStyle(color: Colors.white, letterSpacing: 2),
          ),
          centerTitle: true,
        ),
        body: ListView(
          
          children: [
            // ignore: prefer_const_constructors
            SizedBox(
              height: 25,
            ),
            // ignore: prefer_const_constructors
            Center(
              child: const Text(
                'Selecione as datas da sua reserva',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            GridView.count(
              crossAxisCount: 7,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              shrinkWrap: true,
              children: List.generate(
                30,
                (index) {
                  return GestureDetector(
                    onTap: (() {
                      escolherDias(clicados, index);
                    }),
                    child: Container(
                      margin: const EdgeInsets.all(3),
                      padding: const EdgeInsets.all(10),
                      color: index == setClicado(clicados, index)
                          ? Colors.redAccent
                          : Colors.grey.shade200,
                      child: Text('${index + 1}', 
                      style: TextStyle(
                        fontWeight: FontWeight.bold, 
                        color: index == setClicado(clicados, index) ? Colors.grey.shade200 : Colors.redAccent),
                    ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20,),
            const Expanded(
              child: Center(
                child: Text(
                  'Abril 2022',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
