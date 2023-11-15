import 'dart:convert';

List<PostModel> postModelFromJson(String str) {
  return List<PostModel>.from(
      json.decode(str).map((element) => PostModel.fromjson(element)));
}

class PostModel {
  int userId;
  int id;
  String title;
  String body;

  PostModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory PostModel.fromjson(Map<String, dynamic> json) {
    return PostModel(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }
}
