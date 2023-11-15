import 'dart:developer';
// import 'dart:html';

import 'package:http/http.dart' as http;
import 'package:state_management_1/models/api_model.dart';
import 'package:state_management_1/models/user_model.dart';
import 'package:state_management_1/utilitties/api_utilit.dart';

class ApiServices {
  static final http.Client _client = http.Client();

  static Future<List<PostModel>?> getPost() async {
    final link = Uri.parse(AppUrl.baseUrl + AppUrl.postPath);

    try {
      http.Response response = await _client.get(link);
      if (response.statusCode == 200) {
        return postModelFromJson(response.body);
      }
      return null;
    } catch (e) {
      log('an error occured while executing $e');
    }
    return null;
  }
}

class UserApiServices {
  static http.Client client = http.Client();

  static Future<List<UserFace>?> getUsers() async {
    final links = Uri.parse(AppUrl.baseUrl + AppUrl.usrePath);
    try {
      http.Response response = await client.get(links);
      if (response.statusCode == 200) {
        return userFaceFromJson(response.body);
      }
      return null;
    } catch (e) {
      log('an error occured while executing $e');
    }
    return null;
  }
}
