import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageClient extends StatefulWidget {
  const PageClient({Key? key}) : super(key: key);

  @override
  State<PageClient> createState() => _PageClientState();
}

class _PageClientState extends State<PageClient> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(right: 121, left: 31, bottom: 94),
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Column(
            children: [
              CupertinoTextField(
                placeholder: 'Código do Cliente',
                controller: controller,
                decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: Colors.grey.shade300)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CupertinoTextField(
                placeholder: 'Como podemos Ajudar?',
                maxLines: null,
                controller: controller2,
                decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: Colors.grey.shade300)),
                ),
              ),
            ],
          ),
          const Spacer(),
          CupertinoButton(
              color: const Color(0xFF007AFF),
              child: const Center(child: Text('Enviar')),
              onPressed: () {
                setState(() {
                  controller.clear();
                  controller2.clear();
                });
              }),
        ],
      ),
    );
  }
}
