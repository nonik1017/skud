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
      print('--------------200 emes');
      throw Exception('Error transactions fetching');
    }
  }
}
