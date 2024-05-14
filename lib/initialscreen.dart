import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodpractice/statenotifier.dart';

final countProviders = StateNotifierProvider<Counter, int>((ref) {
  return Counter();
});
final countProvider = StateNotifierProvider.autoDispose<Counter, int>((ref) {
  ref.keepAlive();
  return Counter();
});
final fruitProvider =
    StateNotifierProvider.autoDispose<Picker, String>((ref) {
      final alive=ref.keepAlive();
      final timer=Timer(Duration(seconds: 5), () {
        alive.close();
      });
      ref.onDispose(() {
        timer.cancel();
      });
      return Picker();
    });

class InitialClass extends ConsumerWidget {
  const InitialClass({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(countProvider);
    final fruit = ref.watch(fruitProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('State Notifier Provider'),
      ),
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
