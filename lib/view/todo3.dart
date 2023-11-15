// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:state_management_1/riverpod_main/providers_3.dart';
// import 'package:state_management_1/riverpod_main/todoadd.dart';

// class TodoList extends ConsumerWidget {
//   TodoList({super.key});

//   final TextEditingController texts = TextEditingController();
//   bool isCheked = false;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Todo List Page')),
//       floatingActionButton: FloatingActionButton.extended(
//           onPressed: () {
//             showDialog(
//               context: context,
//               builder: (context) => AlertDialog(
//                 title: Text('Add here'),
//                 content: TextField(
//                   controller: texts,
//                   decoration: InputDecoration(
//                       hintText: 'Type....',
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20))),
//                 ),
//                 actions: [
//                   FloatingActionButton(
//                     onPressed: () {
//                       ref.read(todoProvider2.notifier).;
//                       Navigator.pop(context);
//                     },
//                     child: Icon(Icons.add),
//                   )
//                 ],
//               ),
//             );
//           },
//           label: Text('Add to Todo')),
//       body: ListView.builder(
//         itemCount: ref.watch(todoProvider2).length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             leading: Checkbox(
//               value: isCheked,
//               onChanged: (value) {
//                 isCheked = value!;
//               },
//             ),
//             title: Text(ref.watch(todoProvider2)[index]),
//             trailing: ElevatedButton(
//                 onPressed: () {
//                   ref.read(todoProvider2.notifier).deletMain(index);
//                 },
//                 child: Text('Delete')),
//           );
//         },
//       ),
//     );
//   }
// }
