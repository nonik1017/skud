import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skud/bloc/parent_bloc/parent_bloc.dart';
import 'package:skud/bloc/parent_bloc/parent_event.dart';
import 'package:skud/bloc/parent_bloc/parent_state.dart';
import 'package:skud/presentation/themes/theme.dart' as style;
import 'package:skud/presentation/widgets/side_drawer.dart';
import 'package:skud/repositories/repositories.dart';

class ParentsApp extends StatefulWidget {
  const ParentsApp({Key? key}) : super(key: key);

  @override
  ParentsState createState() => ParentsState();
}

class ParentsState extends State<ParentsApp> {
  final parentRepository = ParentRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ParentBloc>(
        create: (context) => ParentBloc(parentRepository: parentRepository)
          ..add(ParentLoadEvent()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: const Locale('mn', 'MN'),
          theme: ThemeData(
            fontFamily: 'Rubik',
            primarySwatch: Colors.blueGrey,
          ),
          home: BlocBuilder<ParentBloc, ParentState>(
            builder: (context, state) {
              if (state is ParentEmptyState) {
                return const Center(
                  child: Text(
                    'No data recieved',
                    style: TextStyle(fontSize: 18),
                  ),
                );
              }

              if (state is ParentLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is ParentLoadedState) {
                return Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                    centerTitle: true,
                    backgroundColor: Colors.white,
                    iconTheme:
                        const IconThemeData(color: Colors.black, size: 40),
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
                  body: SingleChildScrollView(
                    child: Expanded(
                      child: ListView.builder(
                        // scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.loadedParent.length,
                        itemBuilder: (BuildContext context, int index) =>
                            Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1,
                                      color: Color.fromRGBO(0, 0, 0, 0.2)))),
                          child: ListTile(
                            leading: Container(
                              margin: const EdgeInsets.only(top: 5),
                              child: Icon(
                                Icons.account_circle_outlined,
                                size: 50,
                                color: style.Colors.mainColor,
                              ),
                            ),
                            title: Container(
                              margin: const EdgeInsets.only(top: 15),
                              child: Text(
                                '${state.loadedParent[index].firstName} ${state.loadedParent[index].middleName} ${state.loadedParent[index].lastName}',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                            ),
                            subtitle: Container(
                              margin:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: state.loadedParent[index].phone != null
                                  ? Text(
                                      '${state.loadedParent[index].phone}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    )
                                  : SizedBox(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }

              if (state is ParentEmptyState) {
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
