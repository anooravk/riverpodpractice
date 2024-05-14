import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodpractice/apiservices.dart';
import 'package:riverpodpractice/usermodel.dart';

final apiProvider = Provider<ApiServices>((ref) => ApiServices());
final userProvider = FutureProvider<UserModel>(
    (ref) => ref.read(apiProvider).getUserData());

class UserScreen extends ConsumerWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Future Provider'),),
      body: data.when(data: (data) {
        return ListView.builder(
            itemCount: data.data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${data.data[index].firstName} ${data.data[index].lastName}'),
                subtitle: Text('${data.data[index].email}'),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('${data.data[index].avatar}'),
                ),
              );
            });
      }, error: ((error, stackTrace) {
        return Center(
          child: Text(error.toString()),
        );
      }), loading: (() {
        return Center(
          child: CircularProgressIndicator(),
        );
      })),
    );
  }
}
