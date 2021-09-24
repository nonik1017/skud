class Visit {
  int id;
  String actualDate;
  String type;
  String time;

  Visit({
    required this.id,
    required this.actualDate,
    required this.type,
    required this.time,
  });

  factory Visit.fromJson(Map<String, dynamic> json) {
    final dynamic dateParts = json['actual_date'].split('T');
    return Visit(
      id: json['id'],
      actualDate: dateParts[0],
      time: dateParts[1],
      type: json['type'],
    );
  }
}
