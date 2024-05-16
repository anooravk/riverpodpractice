import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodpractice/navbar.dart';

class BottomNav extends ConsumerWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(navBarProvider);
    return Scaffold(
      body: [
        Center(child: Container(child: Text('Home'),)),
        Center(child: Container(child: Text('Profile'),)),
      ][index],
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'home'),
          NavigationDestination(icon: Icon(Icons.person), label: 'profile'),
        ],
        selectedIndex: index,
        indicatorColor: Colors.purple,
        onDestinationSelected: (value) {
          ref.read(navBarProvider.notifier).selectedIndex(value);
        },
      ),
    );
  }
}
