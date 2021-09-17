import 'package:flutter/material.dart';

class EmptyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 40),
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        '(пусто)',
        style: TextStyle(
          color: Colors.grey[500],
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
