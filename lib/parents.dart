import 'dart:ui';

import 'package:flutter/material.dart';

class ParentsApp extends StatefulWidget {
  const ParentsApp({Key? key}) : super(key: key);

  @override
  ParentsState createState() => ParentsState();
}

class ParentsState extends State<ParentsApp> {
  // Временные переменные только для верстки
  // Удалить после соединения с бэком

  List names = [
    'Кажирахимов Е. 1.',
    'Кажирахимов Е. 2.',
    'Кажирахимов Е. С.',
    'Кажирахимов Е. С.',
    'Кажирахимов Е. С.',
    'Кажирахимов Е. С.',
    'Кажирахимов Е. С.',
    'Кажирахимов Е. С.',
    'Кажирахимов Е. С.',
    'Кажирахимов Е. С.',
    'Кажирахимов Е. С.',
    'Кажирахимов Е. С.'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: Builder(
          builder: (context) => Scaffold(
                body: ListView(
                  children: [
                    for (var name in names)
                      Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          width: 1,
                        ))),
                        child: ListTile(
                          leading: Container(
                              margin: const EdgeInsets.only(top: 5),
                              child: Image.asset('assets/images/avatar.png')),
                          title: Container(
                            margin: const EdgeInsets.only(top: 15),
                            child: Text(
                              name,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                          ),
                          subtitle: Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            child: const Text(
                              '87082624586',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ),
                          // trailing: Container(
                          //   width: 45,
                          //   height: 30,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(8),
                          //     color: const Color.fromRGBO(22, 14, 78, 0.05)
                          //   ),
                          //   child: const Center(
                          //     child: Text(
                          //       '5A',
                          //       style: TextStyle(
                          //         fontSize: 16,
                          //         fontWeight: FontWeight.w600
                          //       ),
                          //     )
                          //   ),
                          // ),
                        ),
                      ),
                  ],
                ),
              )),
    );
  }
}
