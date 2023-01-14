import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: [
            Image.network('https://s2.glbimg.com/pIi7D7kslVg-6wIn6gkYH1a9wrU=/0x0:1920x1080/924x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_e84042ef78cb4708aeebdf1c68c6cbd6/internal_photos/bs/2021/B/s/BCONbbQ5egNbkUt1sIKw/taca-da-feliciade-de-morango.png'
              ),
            
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: Colors.cyanAccent,
                  height: 100,
                  width: 100,

                ),
                Container(
                  color: Colors.greenAccent,
                  height: 100,
                  width: 100,

                ),
                Container(
                  color: Colors.blueAccent,
                  height: 100,
                  width: 100,

                ),
              ],
            ),
        ],
      ),
      
    );
  }
}

