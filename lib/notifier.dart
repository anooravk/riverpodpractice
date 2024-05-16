import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';
part 'notifier.g.dart';

@riverpod
class CounterNotifier extends _$CounterNotifier{
  @override
  int build() {
    return 0;
  }

  void increment(){
    state++;
  }
  void decrement(){
    state--;
  }
}


class Count extends ConsumerWidget {
  const Count({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final count=ref.watch(counterNotifierProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(count.toString()),
            ElevatedButton(onPressed: (){
              ref.read(counterNotifierProvider.notifier).increment();
            }, child: Text('+')),
            ElevatedButton(onPressed: (){
              ref.read(counterNotifierProvider.notifier).decrement();
            }, child: Text('-')),
          ],
        ),
      ),
    );
  }
}
