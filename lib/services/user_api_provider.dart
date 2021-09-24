import 'package:dio/dio.dart';
import 'package:skud/models/user.dart';
import 'package:skud/services/api_provider.dart';

class UserProvider extends Provider {
  Future<dynamic> getUser(token) async {
    final Dio _dio = Dio();
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.headers["Authorization"] = "Bearer $token";

    Response response = await _dio.get(userUrl);

    if (response.statusCode == 200) {
      // print('-----response.data: ${response.data}-----');
      Map<String, dynamic> userJson = Map<String, dynamic>.from(response.data);
      return User.fromJson(userJson);
    } else {
      throw Exception('Error user fetching');
    }
  }
}
