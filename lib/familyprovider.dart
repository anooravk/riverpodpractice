import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

final nameProvider =
    Provider.family<String, String>((ref, name) => "hello from $name!");

class FamProv extends ConsumerWidget {
  const FamProv({super.key});

  @override
  Widget build(BuildContext context, WidgetRef widgetRef) {
    final name = widgetRef.watch(nameProvider('riverpod'));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('family provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              name,
            ),
          ],
        ),
      ),
    );
  }
}
