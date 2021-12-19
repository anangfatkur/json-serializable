// ignore_for_file: non_constant_identifier_names

class UserModel {
  final int id;
  final String email;
  final String first_name;
  final String last_name;
  final String avatar;

  UserModel({
    required this.id,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.avatar,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      id: data["id"],
      email: data["email"],
      first_name: data["first_name"],
      last_name: data["last_name"],
      avatar: data["avatar"],
    );
  }
}
