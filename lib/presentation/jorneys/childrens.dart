import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skud/bloc/children_bloc/children_bloc.dart';
import 'package:skud/bloc/children_bloc/children_event.dart';
import 'package:skud/bloc/children_bloc/children_state.dart';
import 'package:skud/presentation/widgets/emtpy_text_widget.dart';
import 'package:skud/presentation/widgets/side_drawer.dart';
import 'package:skud/repositories/repositories.dart';

class ChildrensApp extends StatefulWidget {
  const ChildrensApp({Key? key}) : super(key: key);

  @override
  ChildrensState createState() => ChildrensState();
}

class ChildrensState extends State<ChildrensApp> {
  final childrenRepository = ChildrenRepository();
  List colors = [
    const Color.fromRGBO(246, 188, 0, 1),
    const Color.fromRGBO(252, 107, 87, 1),
    const Color.fromRGBO(88, 186, 171, 1),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChildrenBloc>(
        create: (context) =>
            ChildrenBloc(childrenRepository: childrenRepository)
              ..add(ChildrenLoadEvent()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: const Locale('mn', 'MN'),
          theme: ThemeData(
            fontFamily: 'Rubik',
            primarySwatch: Colors.blueGrey,
          ),
          home: BlocBuilder<ChildrenBloc, ChildrenState>(
            builder: (context, state) {
              if (state is ChildrenEmptyState) {
                return const Center(
                  child: Text(
                    'No data recieved',
                    style: TextStyle(fontSize: 18),
                  ),
                );
              }

              if (state is ChildrenLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is ChildrenLoadedState) {
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
                    role: 'parent',
                  ),
                  body: SingleChildScrollView(
                    child: Stack(
                      children: [
                        ListView.builder(
                          // scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.loadedChildren.length,
                          itemBuilder: (BuildContext context, int index) =>
                              Container(
                            margin: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                              top: 30,
                              bottom: 20,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: colors[index % 3],
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Icon(
                                      Icons.account_circle_outlined,
                                      size: 75,
                                    ),
                                    Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Expanded(
                                          child: Text(
                                            '${state.loadedChildren[index].lastName} \n${state.loadedChildren[index].firstName} \n${state.loadedChildren[index].middleName}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 120,
                                          height: 37,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: const Color.fromRGBO(
                                                246, 188, 0, 0.3),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${state.loadedChildren[index]?.balance.toInt()} ????',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 24),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                ListTile(
                                  title: const Text('??????'),
                                  subtitle:
                                      state.loadedChildren[index]?.iin != null
                                          ? Text(
                                              '${state.loadedChildren[index]?.iin}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18,
                                              ),
                                            )
                                          : const EmptyText(),
                                ),
                                ListTile(
                                  title: const Text('??????????'),
                                  subtitle:
                                      state.loadedChildren[index]?.username !=
                                              null
                                          ? Text(
                                              '${state.loadedChildren[index]?.username}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18,
                                              ),
                                            )
                                          : const EmptyText(),
                                ),
                                ListTile(
                                  title: const Text('?????????? ????????????????'),
                                  subtitle:
                                      state.loadedChildren[index]?.phone != null
                                          ? Text(
                                              '${state.loadedChildren[index]?.phone}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18,
                                              ),
                                            )
                                          : const EmptyText(),
                                ),
                                ListTile(
                                  title: const Text('E-mail'),
                                  subtitle:
                                      state.loadedChildren[index]?.email != null
                                          ? Text(
                                              '${state.loadedChildren[index]?.email}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18,
                                              ),
                                            )
                                          : const EmptyText(),
                                ),
                                ListTile(
                                  title: const Text('??????????'),
                                  subtitle:
                                      state.loadedChildren[index]?.grade != null
                                          ? Text(
                                              '${state.loadedChildren[index]?.grade}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18,
                                              ),
                                            )
                                          : const EmptyText(),
                                ),
                                // ListTile(
                                //   title: Text('???????????????? ????????????????????????'),
                                //   subtitle: state.loadedChildren[index]
                                //               ?.teacher !=
                                //           null
                                //       ? Text(
                                //           '${state.loadedChildren[index]?.teacher?.lastName} ${state.loadedChildren[index]?.teacher?.firstName} ${state.loadedChildren[index]?.teacher?.middleName}',
                                //           style: TextStyle(
                                //             fontWeight: FontWeight.w700,
                                //             fontSize: 18,
                                //           ),
                                //         )
                                //       : EmptyText(),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              if (state is ChildrenEmptyState) {
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
