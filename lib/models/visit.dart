import 'package:skud/models/user.dart';

class Visit {
  int id;
  String actualDate;
  String type;
  String time;
  User? user;

  Visit({
    required this.id,
    required this.actualDate,
    required this.type,
    required this.time,
    this.user,
  });

  factory Visit.fromJson(Map<String, dynamic> json) {
    final dynamic dateParts = json['actual_date'].split('T');

    Map<String, dynamic> userJson = Map<String, dynamic>.from(json['user']);
    print('Visit.user: ${User.fromJson(userJson)}');
    return Visit(
        id: json['id'],
        actualDate: dateParts[0],
        time: dateParts[1],
        type: json['type'],
        user: User.fromJson(userJson));
  }
}
