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

  Future<dynamic> getChildVisits(token) async {
    final Dio _dio = Dio();
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.headers["Authorization"] = "Bearer $token";

    Response response = await _dio.get(childVisitUrl);

    if (response.statusCode == 200) {
      List<dynamic> childVisitsJson = List<dynamic>.from(response.data);
      return childVisitsJson.map((json) => Visit.fromJson(json)).toList();
    } else {
      throw Exception('Error child visits fetching');
    }
  }

  Future<dynamic> getFilteredVisits(
    token,
    selectedFromDate,
    selectedToDate,
  ) async {
    final Dio _dio = Dio();
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.headers["Authorization"] = "Bearer $token";
    Response response = await _dio.get(filterVisitUrl(
      selectedFromDate,
      selectedToDate,
    ));
    if (response.statusCode == 200) {
      List<dynamic> visitsJson = List<dynamic>.from(response.data);
      return visitsJson.map((json) => Visit.fromJson(json)).toList();
    } else {
      throw Exception('Error filter visits fetching');
    }
  }

  Future<dynamic> getFilteredChildVisits(
    token,
    selectedFromDate,
    selectedToDate,
  ) async {
    final Dio _dio = Dio();
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.headers["Authorization"] = "Bearer $token";
    Response response = await _dio.get(filterChildVisitUrl(
      selectedFromDate,
      selectedToDate,
    ));
    if (response.statusCode == 200) {
      List<dynamic> childVisitsJson = List<dynamic>.from(response.data);
      return childVisitsJson.map((json) => Visit.fromJson(json)).toList();
    } else {
      throw Exception('Error filter child visits fetching');
    }
  }
}
