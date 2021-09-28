import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skud/bloc/transaction_bloc/transaction_bloc.dart';
import 'package:skud/bloc/transaction_bloc/transaction_event.dart';
import 'package:skud/bloc/transaction_bloc/transaction_state.dart';
import 'package:skud/presentation/widgets/filter_period.dart';
import 'package:skud/presentation/widgets/side_drawer.dart';
import 'package:skud/repositories/repositories.dart';

class TransactionsApp extends StatefulWidget {
  const TransactionsApp({Key? key}) : super(key: key);

  @override
  TransactionsState createState() => TransactionsState();
}

class TransactionsState extends State<TransactionsApp> {
  bool filterTapped = false;
  double tableMarginTop = 20;
  final transactionRepository = TransactionRepository();
  final userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TransactionBloc>(
        create: (context) => TransactionBloc(
              transactionRepository: transactionRepository,
              userRepository: userRepository,
            )..add(TransactionLoadEvent()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: const Locale('mn', 'MN'),
          theme: ThemeData(
            fontFamily: 'Rubik',
            primarySwatch: Colors.blueGrey,
          ),
          home: BlocBuilder<TransactionBloc, TransactionState>(
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
                      const SizedBox(
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
                        child: const Center(
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
                                source: 'transactions',
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
                              "Сумма",
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
                              // scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.loadedTransaction.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                          margin:
                                              const EdgeInsets.only(top: 25),
                                          child: Text(
                                            state.loadedTransaction[index]
                                                .actualDate,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          )),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        margin: const EdgeInsets.only(top: 25),
                                        child: Text(
                                          state.loadedTransaction[index].time,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 25),
                                            child: Text(
                                              '${state.loadedTransaction[index].amount}',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          Transform.translate(
                                            offset: const Offset(0, -4),
                                            child: state.loadedTransaction[index].status ==
                                                    'completed'
                                                ? Container(
                                                    height: 11,
                                                    width: 11,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 15),
                                                    decoration: const BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            88, 186, 171, 1),
                                                        shape: BoxShape.circle))
                                                : Container(
                                                    height: 11,
                                                    width: 11,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 15),
                                                    decoration: const BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            253, 82, 67, 1),
                                                        shape:
                                                            BoxShape.circle)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
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
