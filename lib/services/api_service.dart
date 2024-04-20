import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:service_provide_app/models/category_model.dart';

class ApiService {
  static const baseUrl1 = "http://192.168.1.64:8000/user/";
  static const baseUrl2 = "http://192.168.1.64:3000/category";

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
