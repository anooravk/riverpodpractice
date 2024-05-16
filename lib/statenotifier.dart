import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';

class Counter extends StateNotifier<int>{
  Counter():super(0);

  void incrementCounter(){
    state++;
  }

}
class Picker extends StateNotifier<String>{
  Picker():super('none');
  final List<String> fruits = ['Apple', 'Banana', 'Cherry', 'Date', 'Elderberry'];

  void pickRandom() {
    Random random = new Random();
    int randomNumber = random.nextInt(fruits.length);
    state = fruits[randomNumber];
  }
}


class Select extends StateNotifier<GameModel>{
  Select(super.state);

  void updatePlayerCount(String count){
    state=state.copyWith(playersCount: count);
  }
  void updatePlayMode(String mode){
   state=state.copyWith(playMode: mode);
  }

}
@immutable
class GameModel {
  String playersCount;
  String playMode;

  GameModel({
    required this.playersCount,
    required this.playMode,
  });

  GameModel copyWith({
    String? playersCount,
    String? playMode,
  }) =>
      GameModel(
        playersCount: playersCount ?? this.playersCount,
        playMode: playMode ?? this.playMode,
      );
}
