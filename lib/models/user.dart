class User {
  int id;
  int balance;
  String username;
  String role;
  String? cashbox;
  String? dateCreated;
  String? email;
  String? firstName;
  String? lastName;
  String? middleName;
  String? grade;
  int? iin;
  List<String>? children;
  List<String>? parents;
  String? phone;
  List<String>? students;
  String? teacher;

  User({
    required this.id,
    required this.balance,
    required this.username,
    required this.role,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.iin,
    required this.phone,
    required this.email,
    required this.grade,
    required this.teacher,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      balance: json['balance'],
      username: json['username'],
      role: json['role'],
      iin: json['iin'],
      phone: json['phone'],
      email: json['email'],
      grade: json['grade'],
      teacher: json['teacher'],
      firstName: json['first_name'],
      middleName: json['middle_name'],
      lastName: json['last_name'],
    );
  }
}
