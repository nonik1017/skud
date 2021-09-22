class Transaction {
  int id;
  String? actualDate;
  double amount;
  String? time;
  String? status;

  Transaction({
    required this.id,
    required this.actualDate,
    required this.amount,
    required this.time,
    required this.status,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    final dynamic dateParts = json['date_created']?.split('T');
    return Transaction(
      id: json['id'],
      actualDate: dateParts?[0],
      time: dateParts?[1],
      amount: json['amount'],
      status: json['status'],
    );
  }
}
