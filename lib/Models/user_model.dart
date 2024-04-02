class UserModel {
  final int uid;
  final String Name;
  final String Email;
  final String Phone;
  final String Password;
  final String Address;
  final String Role;
  final String Photo;

  UserModel(
      {required this.uid,
      required this.Name,
      required this.Email,
      required this.Phone,
      required this.Password,
      required this.Address,
      required this.Role,
      required this.Photo});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        uid: json['uid'],
        Name: json['Name'],
        Email: json['Email'],
        Phone: json['Phone'],
        Password: json['Password'],
        Address: json['Address'],
        Role: json['Role'],
        Photo: json['Photo']);
  }
}
