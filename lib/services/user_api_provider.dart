import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:skud/models/user.dart';

class UserProvider {
  static String mainUrl = "https://api.skud.codetau.com/api";
  var userUrl = '$mainUrl/v1/auth/user';

  Future<User> getUser(token) async {
    final Dio _dio = Dio();
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.headers["Authorization"] = "Bearer $token";

    Response response = await _dio.get(userUrl);

    if (response.statusCode == 200) {
      print('-----response.data: ${response.data}-----');
      Map<String, dynamic> userJson = jsonDecode(response.data);
      print('-----user: $userJson-----');
      return User.fromJson(userJson);
    } else {
      throw Exception('Error user fetching');
    }
  }
}
