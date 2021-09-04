import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:skud/presentation/widgets/side_drawer.dart';

class ProfileApp extends StatefulWidget {
  const ProfileApp({Key? key}) : super(key: key);

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<ProfileApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: Builder(
          builder: (context) => Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  iconTheme: const IconThemeData(color: Colors.black, size: 40),
                  actions: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: IconButton(
                          onPressed: () => {},
                          icon: const Icon(
                            Icons.notifications_none_rounded,
                            size: 30,
                          )),
                    ),
                  ],
                ),
                drawer: SideDrawer(),
                body: ListView(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(top: 40, left: 40),
                            child: Image.asset(
                              'assets/images/avatar.png',
                            )),
                        Column(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(top: 40, left: 15),
                              child: const Text(
                                "Омарова \nАйлана \nИскандеровна",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Container(
                              height: 37,
                              width: 125,
                              margin: const EdgeInsets.only(top: 15),
                              padding: const EdgeInsets.only(
                                  right: 15, bottom: 4, left: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color.fromRGBO(246, 188, 0, 0.3),
                              ),
                              child: const Text(
                                '1200 тг',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 40, top: 30),
                      child: const Text(
                        'ИИН',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 40),
                      child: const Text(
                        '110525869525',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 40, top: 30),
                      child: const Text(
                        'Логин',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 40),
                      child: const Text(
                        '950912376589',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 40, top: 30),
                      child: const Text(
                        'Номер телефона',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 40),
                      child: const Text(
                        '+7 (707) 856-96-96',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 40, top: 30),
                      child: const Text(
                        'E-mail',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 40),
                      child: const Text(
                        'Ailana2011@gmail.com',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 40, top: 30),
                      child: const Text(
                        'Класс',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 40),
                      child: const Text(
                        '5 “А”',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 40, top: 30),
                      child: const Text(
                        'Классный руководитель',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 40),
                      child: const Text(
                        'Алиев Иманбек Серикович',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              )),
    );
  }
}
