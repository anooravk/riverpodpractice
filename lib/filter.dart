import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter.g.dart';

@riverpod
class Filter extends _$Filter {
  List<Map<String, dynamic>> nameCityMap = [
    {
     "name": 'Alice',"city": 'New York',
    },
    {
    "name": 'Bob',"city": 'Los Angeles',
    },
    {
    "name":  'Charlie',"city": 'Chicago',
    },
    {
    "name":  'Diana',"city": 'Houston',
    },
    {
    "name":  'Eve',"city": 'Phoenix',
    }
  ];

  @override
  List<Map<String, dynamic>> build() {
    return nameCityMap;
  }

  void filterName(name) {
    List<Map<String, dynamic>> result = [];
    if (name.isEmpty)
      result = nameCityMap;
    else
      result = state
          .where((element) => element['name']
              .toString()
              .toLowerCase()
              .contains(name.toString().toLowerCase()))
          .toList();
    state = result;
  }
}
