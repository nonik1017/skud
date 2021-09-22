class Parent {
  int id;
  String firstName;
  String middleName;
  String lastName;
  String? phone;

  Parent({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.phone,
  });

  factory Parent.fromJson(Map<String, dynamic> json) {
    return Parent(
      id: json['id'],
      firstName: json['first_name'],
      middleName: json['middle_name'],
      lastName: json['last_name'],
      phone: json['phone'],
    );
  }
}
