import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodpractice/filter.dart';

class SearchList extends ConsumerWidget {
  const SearchList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final search = ref.watch(filterProvider);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            TextField(
              onChanged: (value) =>
                  ref.read(filterProvider.notifier).filterName(value),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: search!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(search![index]['name']),
                      subtitle: Text(search![index]['city']),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
