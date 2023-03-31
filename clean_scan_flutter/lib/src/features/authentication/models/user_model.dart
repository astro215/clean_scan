  class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String password;
  final String phoneNo;

  const UserModel({
    this.id,
    required this.fullName,
    required this.email,
    required this .password,
    required this.phoneNo,
  });

  toJson() {
    return {
      //'id': id,
      'FullName': fullName,
      'Email': email,
      'Phone': phoneNo,
      'Password': password,
    };
  }
}
