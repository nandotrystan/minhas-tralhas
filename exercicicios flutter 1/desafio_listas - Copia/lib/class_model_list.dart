import 'package:desafio_listas/Strings.dart';

class Lista {
  String title = Strings.title;
  String content = Strings.subtitleCard;
  final DateTime date;

  Lista({required this.title, required this.content}) 
  : date = DateTime.now();

  List<Lista> lista = [];
}
