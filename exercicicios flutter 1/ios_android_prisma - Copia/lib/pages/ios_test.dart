import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCupertino extends StatefulWidget {
  const MyCupertino({
    Key? key,
  }) : super(key: key);

  @override
  State<MyCupertino> createState() => _MyCupertinoState();
}

class _MyCupertinoState extends State<MyCupertino> {
  
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    
    return CupertinoApp(
      home: CupertinoPageScaffold(
          navigationBar: const CupertinoNavigationBar(
            leading: Icon(Icons.arrow_back_ios_new),
            middle: Text('Ajuda'),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                CupertinoTextField.borderless(
                  placeholder: 'Como podemos Ajudar?',
                  maxLines: null,
                  controller: controller,
                ),
                const Spacer(),
                CupertinoButton(
                    color: const Color(0xFF007AFF),
                    child: const Center(child: Text('Enviar')),
                    onPressed: () {
                      setState(() {
                        controller.clear();
                      });
                    })
              ],
            ),
          )),
    );
  }
 
}
