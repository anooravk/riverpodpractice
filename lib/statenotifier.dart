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

