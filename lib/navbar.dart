import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'navbar.g.dart';

@riverpod
class NavBar extends _$NavBar {
  @override
  int build() {
    return 0;
  }

  void selectedIndex(int num) {
    state = num;
  }
}
