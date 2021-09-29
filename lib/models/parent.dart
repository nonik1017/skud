class Parent {
  int id;
  String firstName;
  String middleName;
  String lastName;
  String? phone;
  double? balance;
  String? iin;
  String? username;
  String? email;
  String? grade;
  // User? teacher;

  Parent({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.phone,
    this.balance,
    this.iin,
    this.username,
    this.email,
    this.grade,
    // this.teacher,
  });

  factory Parent.fromJson(Map<String, dynamic> json) {
    // Map<String, dynamic> userJson = Map<String, dynamic>.from(json['teacher']);
    return Parent(
      id: json['id'],
      firstName: json['first_name'],
      middleName: json['middle_name'],
      lastName: json['last_name'],
      phone: json['phone'],
      balance: json['balance'],
      iin: json['iin'],
      username: json['username'],
      email: json['email'],
      grade: json['grade'],
      // teacher: User.fromJson(userJson),
    );
  }
}
