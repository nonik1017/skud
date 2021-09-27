import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skud/bloc/transaction_bloc/child_transaction_bloc.dart';
import 'package:skud/bloc/transaction_bloc/transaction_event.dart';
import 'package:skud/bloc/transaction_bloc/transaction_state.dart';
import 'package:skud/presentation/widgets/filter_period.dart';
import 'package:skud/presentation/widgets/side_drawer.dart';
import 'package:skud/repositories/repositories.dart';

class ChildTransactionsApp extends StatefulWidget {
  const ChildTransactionsApp({Key? key}) : super(key: key);

  @override
  ChildTransactionsState createState() => ChildTransactionsState();
}

class ChildTransactionsState extends State<ChildTransactionsApp> {
  bool filterTapped = false;
  double tableMarginTop = 20;
  final childTransactionRepository = ChildTransactionRepository();
  final userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChildTransactionBloc>(
        create: (context) => ChildTransactionBloc(
              childTransactionRepository: childTransactionRepository,
              userRepository: userRepository,
            )..add(TransactionLoadEvent()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: const Locale('mn', 'MN'),
          theme: ThemeData(
            fontFamily: 'Rubik',
            primarySwatch: Colors.blueGrey,
          ),
          home: BlocBuilder<ChildTransactionBloc, TransactionState>(
            builder: (context, state) {
              if (state is TransactionEmptyState) {
                return Scaffold(
                    appBar: AppBar(
                      elevation: 0,
                      centerTitle: true,
                      backgroundColor: Colors.white,
                      iconTheme:
                          const IconThemeData(color: Colors.black, size: 40),
                      // actions: [
                      //   Container(
                      //     margin: const EdgeInsets.only(right: 10),
                      //     child: IconButton(
                      //         onPressed: () => {},
                      //         icon: const Icon(
                      //           Icons.notifications_none_rounded,
                      //           size: 30,
                      //         )),
                      //   ),
                      // ],
                    ),
                    drawer: const SideDrawer(
                      role: 'student',
                    ),
                    body: ListView(children: [
                      SizedBox(
                        height: 100,
                      ),
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
                              "Сумма",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 50),
                        child: Center(
                          child: Text(
                            'No data recieved',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ]));
              }

              if (state is TransactionLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is TransactionLoadedState) {
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
                        child: Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.loadedTransaction.length,
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
                                        '${state.loadedTransaction[index].user?.firstName}',
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
                                            '${state.loadedTransaction[index].user?.grade}',
                                            style: TextStyle(
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
                                        '${state.loadedTransaction[index]?.actualDate}',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        '${state.loadedTransaction[index]?.time}',
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
                                            child: state.loadedTransaction[index].status ==
                                                    'completed'
                                                ? Container(
                                                    height: 11,
                                                    width: 11,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 15),
                                                    decoration: const BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            88, 186, 171, 1),
                                                        shape: BoxShape.circle))
                                                : Container(
                                                    height: 11,
                                                    width: 11,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 15),
                                                    decoration: const BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            253, 82, 67, 1),
                                                        shape:
                                                            BoxShape.circle)),
                                          ),
                                          Text(
                                            '${state.loadedTransaction[index]?.amount}',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]));
              } //endif

              if (state is TransactionEmptyState) {
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
