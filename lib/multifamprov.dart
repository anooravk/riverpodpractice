import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

final nameProvider = Provider.family<String, GameModel>((ref, mode) =>
    "players : ${mode.playersCount}\ngame mode: ${mode.playMode}");

class MultiFamProv extends ConsumerWidget {
  const MultiFamProv({super.key});

  @override
  Widget build(BuildContext context, WidgetRef widgetRef) {
    final name = widgetRef.watch(nameProvider(GameModel(2, 'hard')));
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

class GameModel {
  final playersCount;
  final playMode;

  GameModel(this.playersCount, this.playMode);
}
