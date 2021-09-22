import 'package:dio/dio.dart';
import 'package:skud/models/parent.dart';
import 'package:skud/services/api_provider.dart';

class ParentProvider extends Provider {
  Future<dynamic> getParents(token) async {
    final Dio _dio = Dio();
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.headers["Authorization"] = "Bearer $token";

    Response response = await _dio.get(parentsUrl);

    if (response.statusCode == 200) {
      List<dynamic> parentsJson = List<dynamic>.from(response.data);
      return parentsJson.map((json) => Parent.fromJson(json)).toList();
    } else {
      throw Exception('Error parents fetching');
    }
  }
}
