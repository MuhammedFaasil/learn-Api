import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_1/models/todo_model.dart';
import 'package:state_management_1/riverpod_main/todoadd.dart';

class TodoIncrement extends ConsumerWidget {
  TodoIncrement({super.key});
  final TextEditingController control = TextEditingController();
 
  final bool isCheked = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo App')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Add task'),
              content: TextField(
                controller: control,
                decoration: InputDecoration(
                    hintText: 'Add task',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      ref.read(todoProvider.notifier).addTodo(
                          TodoModel(task: control.text, isChanged: false));
                      Navigator.pop(context);
                    },
                    child: Text('Add'))
              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: ref.watch(todoProvider).length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Checkbox(
                value: ref.read(todoProvider)[index].isChanged,
                onChanged: (value) {
                  ref.read(todoProvider.notifier).updateTask(
                      index,
                      TodoModel(
                          task: ref.watch(todoProvider)[index].task,
                          isChanged: value!));
                }),
            title: Text(
              ref.watch(todoProvider)[index].task,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Edit Here'),
                          content: TextField(
                            controller: control,
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                          actions: [
                            IconButton(
                                onPressed: () {
                                  ref.read(todoProvider.notifier).updateTask(
                                      index,
                                      TodoModel(
                                          task: control.text,
                                          isChanged: false));
                                },
                                icon: Icon(Icons.brush))
                          ],
                        ),
                      );
                      control.text = ref.watch(todoProvider)[index].task;
                    },
                    child: Text('Edit')),
                ElevatedButton(
                    onPressed: () {
                      ref.read(todoProvider.notifier).deletTask(index);
                    },
                    child: Text('Delete')),
              ],
            ),
          );
        },
      ),
    );
  }
}
