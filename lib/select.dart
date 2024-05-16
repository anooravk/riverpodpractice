import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodpractice/statenotifier.dart';

final selectProvider = StateNotifierProvider<Select, GameModel>(
    (ref) => Select(GameModel(playersCount: 'two', playMode: 'easy')));


class Selective extends ConsumerWidget {
  const Selective({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game=ref.watch(selectProvider);
    final select=ref.watch(selectProvider.select((value) => value.playMode));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            onSubmitted: (value)=>ref.read(selectProvider.notifier).updatePlayerCount(value),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            onSubmitted: (value)=>ref.read(selectProvider.notifier).updatePlayMode(value),

          ),
          SizedBox(
            height: 20,
          ),
          Text(game.playMode),
          Text(game.playersCount),
          Text(select),
        ],
      ),
    );
  }
}
