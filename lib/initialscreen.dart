import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodpractice/statenotifier.dart';

final countProvider = StateNotifierProvider<Counter, int>((ref) => Counter());
final fruitProvider = StateNotifierProvider<Picker, String>((ref) => Picker());

class InitialClass extends ConsumerWidget {
  const InitialClass({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(countProvider);
    final fruit = ref.watch(fruitProvider);
    return Scaffold(
      appBar: AppBar(title: Text('State Notifier Provider'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(count.toString()),
              ElevatedButton(
                  onPressed: () {
                    ref.read(countProvider.notifier).incrementCounter();
                  },
                  child: Text('increment')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(fruit),
              ElevatedButton(
                  onPressed: () {
                    ref.read(fruitProvider.notifier).pickRandom();
                  },
                  child: Text('pick a fruit')),
            ],
          )
        ],
      ),
    );
  }
}
