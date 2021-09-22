import 'package:dio/dio.dart';
import 'package:skud/models/visit.dart';
import 'package:skud/services/api_provider.dart';

class VisitProvider extends Provider {
  Future<dynamic> getVisits(token) async {
    final Dio _dio = Dio();
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.headers["Authorization"] = "Bearer $token";

    Response response = await _dio.get(visitUrl);

    if (response.statusCode == 200) {
      List<dynamic> visitsJson = List<dynamic>.from(response.data);
      return visitsJson.map((json) => Visit.fromJson(json)).toList();
    } else {
      throw Exception('Error visits fetching');
    }
  }
}
