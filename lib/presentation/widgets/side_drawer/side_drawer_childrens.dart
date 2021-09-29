import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skud/presentation/jorneys/childrens.dart';

class SideDrawerChildrens extends StatelessWidget {
  const SideDrawerChildrens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 10),
      child: ListTile(
        onTap: () {
          // Navigator.pop(context);
          Navigator.push(context,
              CupertinoPageRoute(builder: (_) => const ChildrensApp()));
        },
        leading:
            // Image.asset(
            //   'assets/images/parents.png',
            //   height: 24,
            //   width: 24,
            // ),
            SvgPicture.asset(
          'assets/images/parents.svg',
        ),
        title: Transform.translate(
          offset: const Offset(-10, 0),
          child: const Text(
            "Мои дети",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Color.fromRGBO(22, 14, 78, 1),
            ),
          ),
        ),
        // trailing: Icon(Icons.arrow_back),
        // onTap: (){}
      ),
    );
  }
}
