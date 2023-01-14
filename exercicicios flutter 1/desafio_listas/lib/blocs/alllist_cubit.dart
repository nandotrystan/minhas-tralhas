import 'package:flutter_bloc/flutter_bloc.dart';

import '../class_model_list.dart';
import 'alllist_state.dart';

class AllListCubit extends Cubit<List<Lista>> {
  AllListCubit() : super([]);

  void addTask(String title, String content) {
    emit([...state, Lista(title: title, content: content)]);
    //emit([...state, Lista(title: title, content: content)]);
  }

  void removeTask(int index) {
    state.removeAt(index);
    emit([...state]);
  }

  String showTask(int index) {
    return state[index].title;
  }
  
}
