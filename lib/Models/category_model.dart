import 'package:service_provide_app/models/service_model.dart';

class CategoryModel {
  String id;
  String Name;
  String Description;
  String Image;
  List<ServiceModel> Services;

  CategoryModel(
      {required this.id,
      required this.Description,
      required this.Name,
      required this.Services,
      required this.Image});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['_id'],
      Name: json['Name'],
      Description: json['Description'],
      Image: json['Image'],
      Services: List<ServiceModel>.from(
        json['Services'].map((Services) => ServiceModel.fromJson(Services)),
      ),
    );
  }
}
