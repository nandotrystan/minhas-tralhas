import 'dart:convert';

import 'package:http/http.dart';

import 'models/post_model.dart';

class PostRepository {
  Future<List<PostModel>> fetchPosts({int page = 0}) async {
    // a 1ª página é a 0, assim por diante
    final _page = page * 4;
    final _posts = <PostModel>[];
    final response = await get(Uri.parse(
        'https://jsonplaceholder.typicode.com/posts?_start=$_page&_limit=4'));
    if (response.statusCode == 200) {
      final _jsonList = jsonDecode(response.body);
      for (Map<String, dynamic> json in _jsonList) {
        _posts.add(PostModel.fromJson(json));
      }
    }
    return _posts;
  }
}
