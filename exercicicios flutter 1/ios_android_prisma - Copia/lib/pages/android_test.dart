
import 'package:flutter/material.dart';

class MyMaterial extends StatefulWidget {
  const MyMaterial({
    Key? key,
  }) : super(key: key);

  @override
  State<MyMaterial> createState() => _MyMaterialState();
}

class _MyMaterialState extends State<MyMaterial> {
  
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff6200EE),
          title: const Text('Ajuda'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextField(
                controller: controller,
                maxLines: null,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: 'Como podemos Ajudar?'),
              ),
              MaterialButton(
                  color: const Color(0xff6200EE),
                  child: const Text(
                    'ENVIAR',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      controller.clear();
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}