import 'package:skud/models/user.dart';

class Transaction {
  int id;
  String? actualDate;
  double amount;
  String? time;
  String? status;
  User? user;

  Transaction({
    required this.id,
    required this.actualDate,
    required this.amount,
    required this.time,
    required this.status,
    this.user,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    final dynamic dateParts = json['date_created']?.split('T');

    Map<String, dynamic> userJson = Map<String, dynamic>.from(json['user']);
    return Transaction(
      id: json['id'],
      actualDate: dateParts?[0],
      time: dateParts?[1],
      amount: json['amount'],
      status: json['status'],
      user: User.fromJson(userJson),
    );
  }
}
