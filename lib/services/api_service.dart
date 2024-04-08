import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:service_provide_app/models/category_model.dart';
import 'package:service_provide_app/models/user_model.dart';

class ApiService {
  static const baseUrl1 = "http://192.168.1.69:3001/users";
  static const baseUrl2 = "http://192.168.1.69:3002/category";

  Future<List<UserModel>> fetchUser() async {
    final response = await http.get(Uri.parse(baseUrl1));
    if (response.statusCode == 200) {
      final data1 = jsonDecode(response.body) as List;
      return data1.map((userData) => UserModel.fromJson(userData)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<List<CategoryModel>> fetchCategory() async {
    final response = await http.get(Uri.parse(baseUrl2));
    if (response.statusCode == 200) {
      final data2 = jsonDecode(response.body) as List;
      return data2
          .map((categoryData) => CategoryModel.fromJson(categoryData))
          .toList();
    } else {
      throw Exception('Failed to load category');
    }
  }
}
