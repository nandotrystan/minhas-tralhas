import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          toolbarHeight: 100,
        ),
      
      body: const GradesGrids(),
      ),
    );
  }
}

class GradesGrids extends StatelessWidget {
  const GradesGrids({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
          
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const[
            Icon(Icons.arrow_drop_up, size: 80, color: Colors.purple,),
            Icon(Icons.arrow_drop_up, size: 80, color: Colors.purple,),

          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const[
            Icon(Icons.remove_red_eye_outlined, size: 50, color: Colors.black,),
            Icon(Icons.arrow_downward_rounded, size: 50, color: Colors.black,),
            Icon(Icons.remove_red_eye_outlined, size: 50, color: Colors.black,),

          ],
        ),
        Container(
        
          margin: const EdgeInsets.all(15),
          color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: GridView.count(
              childAspectRatio: 0.8,
              shrinkWrap: true,
              crossAxisCount: 6,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              
              children: List.generate(12, (index) {
                  return const NewTooth();
                  },
                  ),
              
              
            ),
          ),
        ),
        const SizedBox(height: 50,),
        
        Expanded(
          child: Container(
            color: Colors.purple,
            
          ),
        ),
      ],
    );
  }
}

class NewTooth extends StatelessWidget {
  const NewTooth({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent.shade100,
      
    );
  }
}
