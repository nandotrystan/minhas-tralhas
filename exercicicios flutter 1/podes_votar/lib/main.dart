import 'package:flutter/material.dart';

void main() {
  runApp(const Idade());
}

class Idade extends StatefulWidget {
  const Idade({Key? key}) : super(key: key);

  @override
  State<Idade> createState() => _IdadeState();
}

class _IdadeState extends State<Idade> {
  TextEditingController idadeController = TextEditingController();

  void verificarIdade(BuildContext context) {
    String msg;
    final idadeText = idadeController.text;
    int idade = 0;

    setState(() {
      if (idadeText.isEmpty) {
        msg = 'Informe a idade';
        caixa(context, msg);
      } else {
        idade = int.parse(idadeText);
        if (idade < 16) {
        msg = 'Não podes votar';
        caixa(context, msg);
      } else if (idade >= 18 && idade < 65) {
        msg = 'Podes votar';
        caixa(context, msg);
      } else {
        msg = 'Voto Facultativo';
        caixa(context, msg);
      }
      }
      
    });
  }

  void caixa(BuildContext context, String msg) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(msg),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                  idadeController.clear();
                },
                child: const Text('Ok'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Podes Votar?',
            style: TextStyle(fontSize: 32),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: idadeController,
                autofocus: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: emptyValidator,
                decoration:
                    const InputDecoration(labelText: 'Informe sua idade'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Builder(builder: (context) {
              return Center(
                child: ElevatedButton(
                  onPressed: () {
                    verificarIdade(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'Verificar idade',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  String? emptyValidator(String? text) {
    if (text == null || text.isEmpty) {
      return 'Informe a idade';
    }
  }

  @override
  void dispose() {
    idadeController.dispose();
    super.dispose();
  }
}
