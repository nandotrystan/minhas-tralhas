import 'package:flutter/material.dart';

String imagem = 'https://i.imgur.com/jTqNa7D.png';

void main() {
  runApp(const Stone());
}

class Stone extends StatefulWidget {
  const Stone({Key? key}) : super(key: key);

  @override
  _StoneState createState() => _StoneState();
}

class _StoneState extends State<Stone> {
  int fragment = 0;
  int piece = 0;
  int stone = 0;

  void somarFragmentos() {
    setState(() {
      fragment++;
      if (fragment >= 10) {
        piece++;
        fragment = 0;
      }

      if (piece >= 10) {
        stone++;
        piece = 0;
      }

      if (stone != 0) {
        imagem = 'https://i.imgur.com/JAeGRb1.png';
      } else if (piece != 0) {
        imagem = 'https://i.imgur.com/IR5Sn6X.png';
      } else {
        imagem = 'https://i.imgur.com/jTqNa7D.png';
      }
     
    }
    );
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: somarFragmentos,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: NetworkImage('https://i.imgur.com/etWX9CB.jpg'),
          )
        ),
        child: Column(
          children: [
            Text(
              'Stones: $stone\nPieces: $piece\nFragmentos: $fragment\n',
              textDirection: TextDirection.ltr, 
              style: const TextStyle(color: Colors.white),
            ),
            Image.network(imagem)
          ],
        ),
      ),
    );
  }
}


