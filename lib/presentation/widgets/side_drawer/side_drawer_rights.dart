import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideDrawerRights extends StatelessWidget {
  final String role;
  const SideDrawerRights({Key? key, required this.role}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: role == 'student'
          ? EdgeInsets.only(top: 260)
          : EdgeInsets.only(top: 200),
      child: const Text(
        "© 2021 Все права защищены.",
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
