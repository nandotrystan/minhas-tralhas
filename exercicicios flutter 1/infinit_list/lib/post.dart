import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int id;
  final String title;
  final String body;

  Post({required this.id, required this.title, required this.body}) : super([id, title, body]);

  @override
  String toString() => 'Post { id: $id }';
}