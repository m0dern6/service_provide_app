import 'package:service_provide_app/models/service_model.dart';

class CategoryModel {
  int cid;
  String CategoryName;
  String CategoryImage;
  List<ServiceModel> Services;

  CategoryModel(
      {required this.cid,
      required this.CategoryName,
      required this.Services,
      required this.CategoryImage});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      cid: json['cid'],
      CategoryName: json['Category Name'],
      CategoryImage: json['Category Image'],
      Services: List<ServiceModel>.from(
        json['Services'].map((Services) => ServiceModel.fromJson(Services)),
      ),
    );
  }
}
