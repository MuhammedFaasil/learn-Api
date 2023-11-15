import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_1/riverpod_main/consumer.dart';
import 'package:state_management_1/view/decrement_1.dart';

class IncrementCounter extends ConsumerWidget {
  const IncrementCounter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Increment Counter'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DecrementCount(),
                    ));
              },
              icon: const Icon(Icons.arrow_forward))
        ],
      ),
      body: Consumer(
        builder: (context, ref, child) {
          return Center(
            child: Text(
              ref.watch(counterApp).toString(),
              style: const TextStyle(fontSize: 50),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            ref.read(counterApp.notifier).state++;
          },
          label: const Text('Add Count')),
    );
  }
}
