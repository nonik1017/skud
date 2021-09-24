import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skud/presentation/jorneys/profile.dart';

class SideDrawerProfile extends StatelessWidget {
  const SideDrawerProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50, left: 10),
      child: ListTile(
        onTap: () {
          Navigator.push(
              context, CupertinoPageRoute(builder: (_) => ProfileApp()));
        },
        leading: SvgPicture.asset(
          'assets/images/user.svg',
        ),
        title: Transform.translate(
          offset: const Offset(-10, 0),
          child: const Text(
            "Личный кабинет",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Color.fromRGBO(22, 14, 78, 1),
            ),
          ),
        ),
      ),
    );
  }
}
