import 'package:dio/dio.dart';
import 'package:skud/models/parent.dart';
import 'package:skud/services/api_provider.dart';

class ChildrenProvider extends Provider {
  Future<dynamic> getChildrens(token) async {
    final Dio _dio = Dio();
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.headers["Authorization"] = "Bearer $token";

    Response response = await _dio.get(childrensUrl);

    if (response.statusCode == 200) {
      List<dynamic> childrensJson = List<dynamic>.from(response.data);
      return childrensJson.map((json) => Parent.fromJson(json)).toList();
    } else {
      throw Exception('Error childrens fetching');
    }
  }
}
