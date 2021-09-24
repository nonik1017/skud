import 'package:dio/dio.dart';
import 'package:skud/models/transaction.dart';
import 'package:skud/services/api_provider.dart';

class TransactionProvider extends Provider {
  Future<dynamic> getTransactions(token) async {
    final Dio _dio = Dio();
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.headers["Authorization"] = "Bearer $token";

    Response response = await _dio.get(transactionUrl);

    if (response.statusCode == 200) {
      List<dynamic> transactionsJson = List<dynamic>.from(response.data);
      return transactionsJson
          .map((json) => Transaction.fromJson(json))
          .toList();
    } else {
      throw Exception('Error transactions fetching');
    }
  }

  Future<dynamic> getChildTransactions(token) async {
    final Dio _dio = Dio();
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.headers["Authorization"] = "Bearer $token";

    Response response = await _dio.get(childTransactionUrl);

    if (response.statusCode == 200) {
      List<dynamic> childTransactionsJson = List<dynamic>.from(response.data);
      return childTransactionsJson
          .map((json) => Transaction.fromJson(json))
          .toList();
    } else {
      throw Exception('Error child transactions fetching');
    }
  }

  Future<dynamic> getFilteredTransactions(
    token,
    selectedFromDate,
    selectedToDate,
  ) async {
    final Dio _dio = Dio();
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.headers["Authorization"] = "Bearer $token";
    Response response = await _dio.get(filterTransactionUrl(
      selectedFromDate,
      selectedToDate,
    ));
    if (response.statusCode == 200) {
      List<dynamic> transactionsJson = List<dynamic>.from(response.data);
      return transactionsJson
          .map((json) => Transaction.fromJson(json))
          .toList();
    } else {
      throw Exception('Error filter transactions fetching');
    }
  }

  Future<dynamic> getFilteredChildTransactions(
    token,
    selectedFromDate,
    selectedToDate,
  ) async {
    final Dio _dio = Dio();
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.headers["Authorization"] = "Bearer $token";
    Response response = await _dio.get(filterChildTransactionUrl(
      selectedFromDate,
      selectedToDate,
    ));
    if (response.statusCode == 200) {
      List<dynamic> childTransactionsJson = List<dynamic>.from(response.data);
      return childTransactionsJson
          .map((json) => Transaction.fromJson(json))
          .toList();
    } else {
      throw Exception('Error filter child transactions fetching');
    }
  }
}
