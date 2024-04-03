import 'package:service_provide_app/models/user_model.dart';
import 'package:service_provide_app/services/api_service.dart';

class ApiRepository {
  final ApiService _apiService = ApiService();

  Future<List<UserModel>> fetchUser() => _apiService.fetchUser();
}
