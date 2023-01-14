import 'package:flutter/material.dart';
import 'package:pages_nomeadas/repository.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('CEP'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(100.0),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(label: Text('Digite um CEP')),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                final myApi = Repository();
                final json = await myApi.fetch(controller.text);
                Navigator.pushNamed(context, '/second',
                    arguments: '${json.city}-${json.state}');
                controller.clear();
              },
              child: const Text('Localizar'))
        ],
      ),
    );
  }
}
