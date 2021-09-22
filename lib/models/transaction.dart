class Transaction {
  int id;
  String actualDate;
  String amount;
  String time;

  Transaction({
    required this.id,
    required this.actualDate,
    required this.amount,
    required this.time,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    final dynamic dateParts = json['actual_date'].split('T');
    return Transaction(
      id: json['id'],
      actualDate: dateParts[0],
      time: dateParts[1],
      amount: json['amount'],
    );
  }
}
