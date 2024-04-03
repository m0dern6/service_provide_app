import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:service_provide_app/models/user_model.dart';

class ApiService {
  static const baseUrl = "http://192.168.1.64:3001/users";

  Future<List<UserModel>> fetchUser() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data.map((userData) => UserModel.fromJson(userData)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
