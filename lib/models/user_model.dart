import 'dart:convert';

List<UserFace> userFaceFromJson(String str) =>
    List<UserFace>.from(json.decode(str).map((x) => UserFace.fromJson(x)));

class UserFace {
  int id;
  String name;
  String username;
  String email;
  String phone;
  String website;

  UserFace({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
  });
  factory UserFace.fromJson(Map<String, dynamic> json) => UserFace(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        website: json["website"],
      );
}
