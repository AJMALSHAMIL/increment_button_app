class UserModel {
  String username;
  String id;
  int countNumber;
  String email;

  UserModel({
    required this.username,
    required this.id,
    required this.countNumber,
    required this.email,
  });

  // Convert a JSON Map to a UserModel
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      id: json['id'],
      countNumber: json['countnumber'],
      email: json['email'],
    );
  }

  // Convert a UserModel to a JSON Map
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'id': id,
      'countnumber': countNumber,
      'email': email,
    };
  }

  // CopyWith method
  UserModel copyWith({
    String? username,
    String? id,
    int? countNumber,
    String? email,
  }) {
    return UserModel(
      username: username ?? this.username,
      id: id ?? this.id,
      countNumber: countNumber ?? this.countNumber,
      email: email ?? this.email,
    );
  }
}
