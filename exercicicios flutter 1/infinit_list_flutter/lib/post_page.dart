
import 'package:flutter/material.dart';


import 'post_bloc.dart';

class PostsPage extends StatelessWidget {
  var initialState; //estado inicial da classe bloc
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: BlocProvider(
        create: (_) => PostBloc(initialState),
        child: PostsList(),
      ),
    );
  }
}
