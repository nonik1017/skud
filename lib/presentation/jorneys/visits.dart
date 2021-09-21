import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skud/bloc/visit_bloc/visit_bloc.dart';
import 'package:skud/bloc/visit_bloc/visit_event.dart';
import 'package:skud/bloc/visit_bloc/visit_state.dart';
import 'package:skud/presentation/widgets/filter_period.dart';
import 'package:skud/presentation/widgets/side_drawer.dart';
import 'package:skud/repositories/repositories.dart';

class VisitsApp extends StatefulWidget {
  const VisitsApp({Key? key}) : super(key: key);

  @override
  VisitsState createState() => VisitsState();
}

class VisitsState extends State<VisitsApp> {
  bool filterTapped = false;
  double tableMarginTop = 20;
  final visitRepository = VisitRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VisitBloc>(
        create: (context) =>
            VisitBloc(visitRepository: visitRepository)..add(VisitLoadEvent()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: const Locale('mn', 'MN'),
          theme: ThemeData(
            fontFamily: 'Rubik',
            primarySwatch: Colors.blueGrey,
          ),
          home: BlocBuilder<VisitBloc, VisitState>(
            builder: (context, state) {
              if (state is VisitEmptyState) {
                return const Center(
                  child: Text(
                    'No data recieved',
                    style: TextStyle(fontSize: 18),
                  ),
                );
              }

              if (state is VisitLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is VisitLoadedState) {
                return Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                    centerTitle: true,
                    backgroundColor: Colors.white,
                    iconTheme:
                        const IconThemeData(color: Colors.black, size: 40),
                  ),
                  drawer: SideDrawer(),
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
                                        if (filterTapped) {
                                          tableMarginTop = 170;
                                          filterTapped = false;
                                        } else {
                                          tableMarginTop = 20;
                                          filterTapped = true;
                                        }
                                      });
                                    },
                                    icon:
                                        const Icon(Icons.filter_alt_outlined)),
                                const Text(
                                  'Фильтр',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      filterTapped
                          ? Container(
                              height: 150,
                              margin: const EdgeInsets.only(top: 5),
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(88, 186, 171, 0.06)),
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
                              )),
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
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: state.loadedVisit.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 25),
                                    child: Text(
                                      state.loadedVisit[index].actualDate,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: state.loadedVisit.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 25),
                                    child: Text(
                                      state.loadedVisit[index].time,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: state.loadedVisit.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Transform.translate(
                                        offset: const Offset(0, -4),
                                        child: Container(
                                            height: 11,
                                            width: 11,
                                            margin: const EdgeInsets.only(
                                                right: 15),
                                            decoration: const BoxDecoration(
                                                color: Color.fromRGBO(
                                                    88, 186, 171, 1),
                                                shape: BoxShape.circle)),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 25),
                                        child: Text(
                                          state.loadedVisit[index].type ==
                                                  'entrance'
                                              ? 'Вход'
                                              : 'Выход',
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
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              } //endif

              if (state is VisitEmptyState) {
                return const Center(
                  child: Text(
                    'Error fetching data',
                    style: TextStyle(fontSize: 18),
                  ),
                );
              }

              return const SizedBox();
            },
          ),
        ));
  }
}
