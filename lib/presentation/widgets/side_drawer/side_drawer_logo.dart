import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideDrawerLogo extends StatelessWidget {
  const SideDrawerLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 10),
      child: ListTile(
        leading: SizedBox(
          height: 36,
          width: 112,
          child: Image.asset(
            'assets/images/logo.png',
            height: 24,
            width: 24,
          ),
        ),
        trailing: IconButton(
          padding: const EdgeInsets.only(right: 1),
          icon: const Icon(
            Icons.close,
            size: 30,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        // onTap: (){}
      ),
    );
  }
}
