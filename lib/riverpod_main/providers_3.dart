import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_1/models/todo_model.dart';

class TodoNotifier extends StateNotifier<List<TodoModel>> {
  TodoNotifier() : super([]);

  void addsmain(TodoModel names) {
    state = [names, ...state];
  }

  void deletMain(int named) {
    state = [
      for (TodoModel abc in state)
        if (abc != state[named]) abc
    ];
  }

  void updateMain(int change, TodoModel updateTask) {
    state = [
      for (TodoModel ints in state)
        if (ints != state[change]) ints else updateTask
    ];
  }
}

final todoProvider2 = StateNotifierProvider<TodoNotifier, List<TodoModel>>((ref) {
  return TodoNotifier();
});
