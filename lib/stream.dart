import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodpractice/statenotifier.dart';

final streamProvider = StreamProvider((ref) {
  return Stream.periodic(Duration(milliseconds: 500), ((computationCount) {
    return computationCount;
  }));
});

class StreamClass extends ConsumerWidget {
  const StreamClass({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stream = ref.watch(streamProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Provider'),
      ),
      body: stream.when(data: (data) {
        return Center(
            child: Text(
          '${data}',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ));
      }, error: ((error, stackTrace) {
        return Center(
          child: Text(error.toString()),
        );
      }), loading: (() {
        return Center(
          child: CircularProgressIndicator(),
        );
      })),
    );
  }
}
