import 'package:flutter/material.dart';
import 'package:idilene/strings.dart';

void main() {
  runApp(const Idade());
}

class Idade extends StatefulWidget {
  const Idade({Key? key}) : super(key: key);

  @override
  _IdadeState createState() => _IdadeState();
}

class _IdadeState extends State<Idade> {
  //final Color _primaryColor = const Color.fromARGB(255, 6, 70, 122);
  final theme = ThemeData();
  final TextEditingController controllerAge = TextEditingController();
  num age = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            Strings.titleApp,
            style: TextStyle(fontSize: 32),
          ),
          centerTitle: true,
          backgroundColor: theme.primaryColor,
        ),
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 64.0, vertical: 20.0),
              child: TextField(
                controller: controllerAge,
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 18.0),
                decoration: InputDecoration(
                  hintText: Strings.infromYourAge,
                  fillColor: Colors.blue.shade700,
                ),
              ),
            ),
            Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    checkAge(context);
                  },
                  child: const Text(Strings.checkAge),
                );
              }
            ),
          ],
        ),
      ),
    );
  }

  void checkAge(BuildContext context) {
    age = 0;
    setState(
      () {
        if (controllerAge.text.isEmpty) {
          alertDialogCheckedAge(context, Strings.infromYourAge);
        }
        age = int.parse(controllerAge.text);
        if (age == 0) {
          alertDialogCheckedAge(context, Strings.infromYourAge);
        } else {
          if (age == 16 || age > 64) {
            alertDialogCheckedAge(context, Strings.optionalVote);
          } else if (age > 17 && age < 65) {
            alertDialogCheckedAge(context, Strings.obligatoryVote);
          } else {
            alertDialogCheckedAge(context, Strings.dontVote);
          }
        }

        // alertDialogCheckedAge(context, "ok");
      },
    );
  }

  void alertDialogCheckedAge(BuildContext context, String content) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(content),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Ok"),
              ),
            ],
          );
        });
  }

  @override
  void dispose() {
    controllerAge.clear();
    controllerAge.dispose();
    super.dispose();
  }
}

