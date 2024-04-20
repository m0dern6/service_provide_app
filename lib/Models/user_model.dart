class UserModel {
  int id;
  String name;
  String email;
  String password;
  int phoneNo;
  String address;
  String role;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNo,
    required this.address,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      name: json['Name'],
      email: json['Email'],
      password: json['Password'],
      phoneNo: json['PhoneNo'],
      address: json['Address'],
      role: json['Role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'Name': name,
      'Email': email,
      'Password': password,
      'PhoneNo': phoneNo,
      'Address': address,
      'Role': role,
    };
  }
}
