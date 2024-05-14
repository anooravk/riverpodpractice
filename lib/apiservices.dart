import 'dart:convert';

import 'package:riverpodpractice/usermodel.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  final url = 'https://reqres.in/api/users?page=1';

  Future<UserModel> getUserData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
