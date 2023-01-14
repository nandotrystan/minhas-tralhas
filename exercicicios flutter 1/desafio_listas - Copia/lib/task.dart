import 'dart:ui';

import 'package:desafio_listas/my_sheet.dart';
import 'package:flutter/material.dart';

import 'Strings.dart';
import 'class_model_list.dart';

class MyTask extends StatefulWidget {
  const MyTask({Key? key}) : super(key: key);

  @override
  State<MyTask> createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> {
  @override
  Widget build(BuildContext context) {
    List<Lista> listaaa = [
      Lista(title: Strings.title, content: Strings.subtitleCard),
      Lista(title: 'Lavar a casa', content: 'Agora'),
    ];
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.title),
      ),
      body: ListView.builder(
        itemCount: listaaa.length,
        itemBuilder: (context, index) {
          final tagList = listaaa[index];
          return Container(
              margin: const EdgeInsets.all(15),
              color: theme.colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          tagList.title,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold,),
                        ),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.close, color: theme.colorScheme.onSecondary))
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      tagList.content,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(children: [
                      Icon(Icons.access_time, color: theme.colorScheme.onSecondary),
                      const SizedBox(width: 4,),
                      Text(tagList.date.toString(), style: TextStyle(fontSize: 16,color: theme.colorScheme.onSecondary ),),
                    ],)
                  ],
                ),
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            showModalBottomSheet(
              context: context, 
              builder: (context) => MySheet(),
              isDismissible: false,
              barrierColor: Colors.black.withOpacity(0.7),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(40))
              )
            ),
        child: Icon(
          Icons.add_outlined,
          color: theme.colorScheme.primaryContainer,
          size: 49,
        ),
        //backgroundColor: theme.colorScheme.tertiary,
      ),
    );
  }
}
