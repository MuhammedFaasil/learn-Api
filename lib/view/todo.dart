import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  TextEditingController myController = TextEditingController();
  List<String> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, title: const Text('Todo App')),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text('${index + 1}'),
            title: Text(
              items[index],
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    items.removeAt(index);
                  });
                },
                icon: const Icon(Icons.close)),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  width: MediaQuery.sizeOf(context).width,
                  // height: MediaQuery.sizeOf(context).height / 3,
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  color: Colors.grey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 350,
                        child: TextField(
                          controller: myController,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              hintText: 'Type...',
                              hintStyle: const TextStyle(color: Colors.grey),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black),
                          onPressed: () {
                            setState(() {
                              items.add(myController.text);
                              Navigator.pop(context);
                            });
                            myController.clear();
                          },
                          child: const Text('Add'))
                    ],
                  ),
                );
              },
            );
          },
          label: const Text('Add to list')),
    );
  }
}
