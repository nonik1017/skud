import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skud/bloc/visit_bloc/child_visit_bloc.dart';
import 'package:skud/bloc/visit_bloc/visit_event.dart';
import 'package:skud/bloc/visit_bloc/visit_state.dart';
import 'package:skud/presentation/widgets/filter_period.dart';
import 'package:skud/presentation/widgets/side_drawer.dart';
import 'package:skud/repositories/repositories.dart';

class ChildVisitsApp extends StatefulWidget {
  const ChildVisitsApp({Key? key}) : super(key: key);

  @override
  ChildVisitsState createState() => ChildVisitsState();
}

class ChildVisitsState extends State<ChildVisitsApp> {
  bool filterTapped = false;
  double tableMarginTop = 20;
  final childVisitRepository = ChildVisitRepository();
  final userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChildVisitBloc>(
        create: (context) => ChildVisitBloc(
              childVisitRepository: childVisitRepository,
              userRepository: userRepository,
            )..add(VisitLoadEvent()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: const Locale('mn', 'MN'),
          theme: ThemeData(
            fontFamily: 'Rubik',
            primarySwatch: Colors.blueGrey,
          ),
          home: BlocBuilder<ChildVisitBloc, VisitState>(
            builder: (context, state) {
              if (state is VisitEmptyState) {
                return Scaffold(
                    appBar: AppBar(
                      elevation: 0,
                      centerTitle: true,
                      backgroundColor: Colors.white,
                      iconTheme:
                          const IconThemeData(color: Colors.black, size: 40),
                    ),
                    drawer: const SideDrawer(
                      role: 'student',
                    ),
                    body: ListView(children: [
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
                              child: const FilterPeriodApp(
                                source: 'child_visits',
                              ),
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
                      const SingleChildScrollView(
                        child: Expanded(
                            child: Center(
                          child: Text('No data recieved'),
                        )),
                      ),
                    ]));
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
                    drawer: SideDrawer(
                      role: state.loadedUser.role != null
                          ? '${state.loadedUser.role}'
                          : 'student',
                    ),
                    body: ListView(children: [
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
                              child: const FilterPeriodApp(
                                source: 'child_visits',
                              ),
                            )
                          : Container(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(top: 20, left: 35),
                              child: const Text(
                                'Дата',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                          // Container(
                          //   margin: const EdgeInsets.only(top: 20),
                          //   child: const Text(
                          //     "Время",
                          //     style: TextStyle(
                          //       fontSize: 14,
                          //       fontWeight: FontWeight.w400,
                          //     ),
                          //   ),
                          // ),
                          Container(
                            margin: const EdgeInsets.only(top: 20, right: 35),
                            child: const Text(
                              "Выход",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        child: Stack(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.loadedVisit.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  Container(
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 1,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.2)))),
                                child: ListTile(
                                  title: Container(
                                    margin: const EdgeInsets.only(
                                      top: 15,
                                      left: 20,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${state.loadedVisit[index].user?.firstName}',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 15),
                                          width: 50,
                                          height: 23,
                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                22, 14, 78, 0.1),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${state.loadedVisit[index].user?.grade}',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  subtitle: Container(
                                    margin: const EdgeInsets.only(
                                      top: 10,
                                      bottom: 10,
                                      left: 20,
                                      right: 20,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${state.loadedVisit[index]?.actualDate}',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          '${state.loadedVisit[index]?.time}',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Transform.translate(
                                              offset: const Offset(0, 0),
                                              child: state.loadedVisit[index].type ==
                                                      'entrance'
                                                  ? Container(
                                                      height: 11,
                                                      width: 11,
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 15),
                                                      decoration: const BoxDecoration(
                                                          color: Color.fromRGBO(
                                                              88, 186, 171, 1),
                                                          shape:
                                                              BoxShape.circle))
                                                  : Container(
                                                      height: 11,
                                                      width: 11,
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 15),
                                                      decoration: const BoxDecoration(
                                                          color: Color.fromRGBO(
                                                              253, 82, 67, 1),
                                                          shape: BoxShape.circle)),
                                            ),
                                            state.loadedVisit[index]?.type ==
                                                    'entrance'
                                                ? const Text(
                                                    'Вход',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black,
                                                    ),
                                                  )
                                                : const Text(
                                                    'Выход',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]));
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
