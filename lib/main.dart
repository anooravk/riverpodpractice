import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpodpractice/search.dart';
import 'package:riverpodpractice/select.dart';
import 'package:riverpodpractice/userscreen.dart';

import 'bottomnav.dart';
import 'initialscreen.dart';
import 'notifier.dart';

final nameProvider = Provider<String>((ref) => "hello from riverpod!");
final counterProvider = StateProvider<int>((ref) => 0);
final themeProvider = StateProvider<bool>((ref) => true);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLightTheme = ref.watch(themeProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: isLightTheme ? ThemeData.light() : ThemeData.dark(),
      home: const BottomNav(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef widgetRef) {
    final name = widgetRef.watch(nameProvider);
    final count = widgetRef.watch(counterProvider);
    final isLightTheme = widgetRef.watch(themeProvider);

    widgetRef.listen(counterProvider, (previous, next) {
      if (previous == 4)
        print("previous");
      if (next == 4)
        print("next");
      if (count == 4)
        print("four"); //prints at 5 starts from 0
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text('RIVERPOD'),
        actions: [
          IconButton(
              onPressed: () {
                //can be discarded in various ways
                widgetRef.invalidate(counterProvider);
                widgetRef.refresh(counterProvider);
                widgetRef.read(counterProvider.notifier).update((state) => 0);
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Switch(value: isLightTheme, onChanged: (value) =>
            widgetRef
                .read(themeProvider.notifier)
                .state = value),
            Text(
              name,
            ),
            Text(
              count.toString(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //can be incremented in mutiple ways
          widgetRef
              .read(counterProvider.notifier)
              .state++;
          widgetRef.read(counterProvider.notifier).update((state) => state + 1);

          print(count);
          print(name);
        },
        child: Icon(Icons.plus_one),
      ),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text('RIVERPOD'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer(builder: (context, ref, child) {
              final name = ref.watch(nameProvider);
              return InkWell(
                  onTap: () {
                    final name = ref
                        .read(counterProvider.notifier)
                        .state++;
                    print(name);
                  },
                  child: Text(name));
            })
          ],
        ),
      ),
    );
  }
}

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  void initState() {
    super.initState();
    final count = ref.read(counterProvider);
    //reads one time
    print(count);
  }

  @override
  Widget build(BuildContext context) {
    final count = ref.watch(counterProvider);
    //listens and update ui as value changes,use in build method
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text('RIVERPOD'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(count.toString()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final count = ref
              .read(counterProvider.notifier)
              .state--;
          print(count);
        },
        child: Icon(Icons.plus_one),
      ),
    );
  }
}
