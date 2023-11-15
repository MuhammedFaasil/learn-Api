import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_1/riverpod_main/consumer.dart';

class DecrementCount extends ConsumerWidget {
  const DecrementCount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Decrement Count'),
      ),
      body: Center(
        child: Text(
          ref.watch(counterApp).toString(),
          style: const TextStyle(fontSize: 50),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.red,
          onPressed: () {
            ref.read(counterApp.notifier).state--;
          },
          label: const Text('Less Count')),
    );
  }
}
