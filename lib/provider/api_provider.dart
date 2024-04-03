import 'package:flutter/material.dart';
import 'package:service_provide_app/models/user_model.dart';
import 'package:service_provide_app/repositories/api_repository.dart';

class ApiProvider extends ChangeNotifier {
  final ApiRepository _apiRepository = ApiRepository();

  List<UserModel> _users = [];
  List<UserModel> get users => _users;

  ApiProvider() {
    fetchUser();
  }

  Future<void> fetchUser() async {
    _users = await _apiRepository.fetchUser();
    notifyListeners();
  }
}
