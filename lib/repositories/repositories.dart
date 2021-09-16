import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:skud/models/user.dart';
import 'package:skud/services/user_api_provider.dart';

class UserRepository {
  static String mainUrl = "https://api.skud.codetau.com/api";
  var loginUrl = '$mainUrl/v1/token';

  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final Dio _dio = Dio();
  final UserProvider _userProvider = UserProvider();

  Future<bool> hasToken() async {
    var value = await storage.read(key: 'access');
    return value != null;
  }

  Future<void> persistToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'token');
    storage.deleteAll();
  }

  Future<String> login(String username, String password) async {
    Response response = await _dio.post(loginUrl, data: {
      "username": username,
      "password": password,
    });
    return response.data["access"];
  }

  Future<String> getToken() async {
    if (await storage.containsKey(key: 'token')) {
      var token = await storage.read(key: 'token');

      if (token != null && token != '') {
        return token;
      } else {
        throw Exception('Smth going wrong');
      }
    } else {
      throw Exception('Smth going wrong');
    }
  }

  Future<User> getUser() async {
    var token = await getToken();
    return await _userProvider.getUser(token);
  }
}
