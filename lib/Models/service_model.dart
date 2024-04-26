class ServiceModel {
  int id;
  String Name;
  String Description;
  String Price;
  String Duration;

  ServiceModel(
      {required this.id,
      required this.Name,
      required this.Description,
      required this.Price,
      required this.Duration});

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['_id'],
      Name: json['Name'],
      Description: json['Description'],
      Price: json['Price'],
      Duration: json['Duration'],
    );
  }
}
