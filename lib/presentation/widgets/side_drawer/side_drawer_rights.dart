import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideDrawerRights extends StatelessWidget {
  const SideDrawerRights({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 260),
      child: const Text(
        "© 2021 Все права защищены.",
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
