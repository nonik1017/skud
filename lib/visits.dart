import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:skud/filter_period.dart';

class VisitsApp extends StatefulWidget {
  const VisitsApp({Key? key}) : super(key: key);

  @override
  VisitsState createState() => VisitsState();
}

class VisitsState extends State<VisitsApp> {
  
  // Временный переменные только для верстки
  // Удалить после соединения с бэком

  List dates = [
    '15.05.2020', 
    '15.05.2020', 
    '15.05.2020', 
    '15.05.2020', 
    '15.05.2020', 
    '15.05.2020', 
    '15.05.2020', 
    '15.05.2020', 
    '15.05.2020', 
    '15.05.2020', 
    '15.05.2020', 
    '15.05.2020'];

  List times = [
    '08:30', 
    '08:30', 
    '08:30', 
    '08:30', 
    '08:30', 
    '08:30', 
    '08:30', 
    '08:30', 
    '08:30', 
    '08:30', 
    '08:30', 
    '08:30'];

  List types = [
    'Вход', 
    'Выход', 
    'Вход', 
    'Выход', 
    'Вход', 
    'Выход', 
    'Вход', 
    'Выход', 
    'Вход', 
    'Выход', 
    'Вход', 
    'Выход'];  

  // Не удалять
  bool filterTapped = false;  
  double tableMarginTop = 20;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: Builder(
        builder: (context) => Scaffold(
          body: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 40),
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (filterTapped){
                                tableMarginTop = 170;
                                filterTapped = false;
                              } else {
                                tableMarginTop = 20;
                                filterTapped = true; 
                              }
                            });
                          }, 
                          icon: const Icon(Icons.filter_alt_outlined)
                        ),

                        const Text(
                          'Фильтр',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),

              filterTapped ? 
              Container(
                height: 150,
                margin: const EdgeInsets.only(top: 5),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(88, 186, 171, 0.06)
                ),
                child: const FilterPeriodApp(),
              ) 
              : Container(),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: const Text(
                      'Дата',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: const Text(
                      "Время",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: const Text(
                      "Тип",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),

                ],
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      for (var date in dates) 
                        Container(
                          margin: const EdgeInsets.only(top: 25),
                          child: Text(
                            date,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ),

                    ],
                  ),

                  Column(
                    children: <Widget>[
                      for (var time in times)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Transform.translate(
                              offset: const Offset(0, -4),
                              child: Container(
                                height: 11,
                                width: 11,
                                margin: const EdgeInsets.only(right: 15),
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(88, 186, 171, 1),
                                  shape: BoxShape.circle
                                )
                              ),

                            ),

                            Container(
                              margin: const EdgeInsets.only(top: 25),
                              child: Text(
                                time,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),

                          ],
                        ),

                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      for (var type in types)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Transform.translate(
                              offset: const Offset(0, -4),
                              child: Container(
                                height: 11,
                                width: 11,
                                margin: const EdgeInsets.only(right: 15),
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(253, 82, 67, 1),
                                  shape: BoxShape.circle
                                )
                              ),

                            ),

                            Container(
                              margin: const EdgeInsets.only(top: 25),
                              child: Text(
                                type,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),

                          ],
                        ),

                    ],
                  ),

                ],
              ),
            ],
          
          ),
        )
      ),
    );
  }
}