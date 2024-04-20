import 'package:flutter/material.dart';
import 'package:service_provide_app/models/category_model.dart';
import 'package:service_provide_app/repositories/api_repository.dart';

class ApiProvider extends ChangeNotifier {
  final ApiRepository _apiRepository = ApiRepository();

  List<CategoryModel> _categories = [];
  List<CategoryModel> get categories => _categories;

  ApiProvider() {
    fetchCategory();
  }

  Future<void> fetchCategory() async {
    _categories = await _apiRepository.fetchCategory();
    notifyListeners();
  }
}
