import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

final nameProvider = Provider<String>((ref) => "hello from riverpod!");
final counterProvider = StateProvider<int>((ref) => 0);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef widgetRef) {
    final name = widgetRef.watch(nameProvider);
    final count = widgetRef.watch(counterProvider);
    widgetRef.listen(counterProvider, (previous, next) {
      if(previous==4)
        print("previous");
      if(next==4)
        print("next");
      if(name==4)
        print("four");
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('RIVERPOD'),
        actions: [
          IconButton(
              onPressed: () {
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
         widgetRef.read(counterProvider.notifier).state++;
          widgetRef.read(counterProvider.notifier).update((state) => state+1);

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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
                    final name = ref.read(counterProvider.notifier).state++;
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
    print(count);
  }

  @override
  Widget build(BuildContext context) {
    final count = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
          final count = ref.read(counterProvider.notifier).state--;
          print(count);
        },
        child: Icon(Icons.plus_one),
      ),
    );
  }
}
