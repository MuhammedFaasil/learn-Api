
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_1/models/todo_model.dart';

class TodoNotifier extends StateNotifier<List<TodoModel>> {
  TodoNotifier() : super([]);

  void addTodo(TodoModel control) {
    state = [control, ...state];
  }

  void deletTask(int index) {
    state = [
      for (TodoModel abc in state)
        if (abc != state[index]) abc
    ];
  }
  void updateTask(int index, TodoModel updated) {
  state = [
    for (TodoModel task in state)
    if(task != state [index]) task 
    else updated
  ];
}
}



final todoProvider =
    StateNotifierProvider<TodoNotifier, List<TodoModel>>((ref) {
  return TodoNotifier();
});
