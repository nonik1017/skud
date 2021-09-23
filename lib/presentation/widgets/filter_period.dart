import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skud/bloc/visit_bloc/visit_bloc.dart';
import 'package:skud/bloc/visit_bloc/visit_event.dart';

class FilterPeriodApp extends StatefulWidget {
  const FilterPeriodApp({Key? key}) : super(key: key);

  get selectedFromDate => null;

  @override
  FilterPeriodState createState() => FilterPeriodState();
}

DateTime selectedFromDate = DateTime.now();
DateTime selectedToDate = DateTime.now();

class FilterPeriodState extends State<FilterPeriodApp> {
  _selectDate(BuildContext context) async {
    final DateTime? fromPicked = await showDatePicker(
      context: context,
      helpText: 'Выберите дату с',
      initialDate: selectedFromDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    final DateTime? toPicked = await showDatePicker(
      context: context,
      helpText: 'Выберите дату до',
      initialDate: selectedToDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (fromPicked != null && fromPicked != selectedFromDate) {
      setState(() {
        selectedFromDate = fromPicked;
        _onVisitFilterButtonPressed(selectedFromDate, selectedToDate);
      });
    }

    if (toPicked != null && toPicked != selectedToDate) {
      setState(() {
        selectedToDate = selectedToDate.isBefore(selectedFromDate)
            ? selectedFromDate
            : toPicked;

        _onVisitFilterButtonPressed(selectedFromDate, selectedToDate);
      });
    }
  }

  _onVisitFilterButtonPressed(selectedFromDate, selectedToDate) {
    BlocProvider.of<VisitBloc>(context).add(
      VisitFilterButtonPressed(
        selectedFromDate: selectedFromDate.toString(),
        selectedToDate: selectedToDate.toString(),
      ),
    );
  }

  _onCancelButtonPressed() {
    selectedFromDate = DateTime.now();
    selectedToDate = DateTime.now();
    BlocProvider.of<VisitBloc>(context).add(
      VisitLoadEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: Builder(
        builder: (context) => Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Период',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 131,
                    height: 40,
                    child: ElevatedButton(
                        onPressed: () => _selectDate(context),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    side: const BorderSide(
                                        color:
                                            Color.fromRGBO(88, 186, 171, 1)))),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            elevation: MaterialStateProperty.all<double?>(0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${selectedFromDate.toLocal()}".split(' ')[0],
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            const Icon(
                              Icons.calendar_today_outlined,
                              size: 17,
                              color: Colors.black,
                            )
                          ],
                        )),
                  ),
                  Container(
                      height: 1,
                      width: 10,
                      margin: const EdgeInsets.only(left: 5, right: 5, top: 10),
                      decoration: const BoxDecoration(color: Colors.black)),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 131,
                    height: 40,
                    child: ElevatedButton(
                        onPressed: () => _selectDate(context),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    side: const BorderSide(
                                        color:
                                            Color.fromRGBO(88, 186, 171, 1)))),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            elevation: MaterialStateProperty.all<double?>(0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${selectedToDate.toLocal()}".split(' ')[0],
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            const Icon(
                              Icons.calendar_today_outlined,
                              size: 17,
                              color: Colors.black,
                            )
                          ],
                        )),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: 97,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () => {},
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  side: const BorderSide(
                                      color: Color.fromRGBO(88, 186, 171, 1)))),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromRGBO(88, 186, 171, 1)),
                          elevation: MaterialStateProperty.all<double?>(0)),
                      child: const Text(
                        'Поиск',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 15),
                    width: 97,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () => {
                        setState(() {
                          _onCancelButtonPressed();
                        })
                      },
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      side: const BorderSide(
                                          color: Color.fromRGBO(
                                              28, 28, 32, 0.05)))),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromRGBO(28, 28, 32, 0.05)),
                          elevation: MaterialStateProperty.all<double?>(0)),
                      child: const Text(
                        'Отмена',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
