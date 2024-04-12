class ServiceModel {
  int sid;
  String ServiceName;
  String Description;
  String Price;

  ServiceModel(
      {required this.sid,
      required this.ServiceName,
      required this.Description,
      required this.Price});

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      sid: json['sid'],
      ServiceName: json['Service Name'],
      Description: json['Description'],
      Price: json['Price'],
    );
  }
}
