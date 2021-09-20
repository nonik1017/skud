import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skud/bloc/auth_bloc/auth.dart';
import 'package:skud/bloc/user_bloc/user_bloc.dart';
import 'package:skud/bloc/user_bloc/user_event.dart';
import 'package:skud/bloc/user_bloc/user_state.dart';
import 'package:skud/presentation/themes/theme.dart' as style;
import 'package:skud/presentation/widgets/emtpy_text_widget.dart';
import 'package:skud/presentation/widgets/side_drawer.dart';
import 'package:skud/repositories/repositories.dart';

class ProfileApp extends StatelessWidget {
  final userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
        create: (context) =>
            UserBloc(userRepository: userRepository)..add(UserLoadEvent()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: const Locale('mn', 'MN'),
          theme: ThemeData(
            fontFamily: 'Rubik',
            primarySwatch: Colors.blueGrey,
          ),
          home: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserEmptyState) {
                return const Center(
                  child: Text(
                    'No data recieved',
                    style: TextStyle(fontSize: 18),
                  ),
                );
              }

              if (state is UserLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is UserLoadedState) {
                return Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                    centerTitle: true,
                    backgroundColor: Colors.white,
                    iconTheme:
                        const IconThemeData(color: Colors.black, size: 40),
                    actions: [
                      // Container(
                      //   margin: const EdgeInsets.only(right: 10),
                      //   child: IconButton(
                      //       onPressed: () => {},
                      //       icon: const Icon(
                      //         Icons.notifications_none_rounded,
                      //         size: 30,
                      //       )),
                      // ),
                      IconButton(
                          icon: Icon(Icons.logout_outlined),
                          onPressed: () {
                            BlocProvider.of<AuthenticationBloc>(context).add(
                              LoggedOut(),
                            );
                          })
                    ],
                  ),
                  drawer: SideDrawer(),
                  body: ListView(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(top: 30, left: 40),
                              child: const Icon(
                                Icons.account_circle_outlined,
                                size: 100,
                                color: style.Colors.mainColor,
                              )),
                          Column(
                            children: <Widget>[
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 40, left: 15),
                                child: Text(
                                  '${state.loadedUser?.firstName} ${state.loadedUser?.middleName} ${state.loadedUser?.lastName}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: style.Colors.textMain,
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
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    '${state.loadedUser?.balance}',
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      color: style.Colors.textMain,
                                    ),
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
                            color: style.Colors.textMain,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      state.loadedUser?.iin != null
                          ? Container(
                              margin: const EdgeInsets.only(left: 40),
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                '${state.loadedUser?.iin}',
                                style: const TextStyle(
                                    color: style.Colors.textMain,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                          : EmptyText(),
                      Container(
                        margin: const EdgeInsets.only(left: 40, top: 30),
                        child: const Text(
                          'Логин',
                          style: TextStyle(
                              color: style.Colors.textMain,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 40),
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          state.loadedUser.username,
                          style: const TextStyle(
                              color: style.Colors.textMain,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 40, top: 30),
                        child: const Text(
                          'Номер телефона',
                          style: TextStyle(
                              color: style.Colors.textMain,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      state.loadedUser?.phone != null
                          ? Container(
                              margin: const EdgeInsets.only(left: 40),
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                '${state.loadedUser?.phone}',
                                style: const TextStyle(
                                    color: style.Colors.textMain,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                          : EmptyText(),
                      Container(
                        margin: const EdgeInsets.only(left: 40, top: 30),
                        padding: const EdgeInsets.only(top: 10),
                        child: const Text(
                          'E-mail',
                          style: TextStyle(
                              color: style.Colors.textMain,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      state.loadedUser?.email != null
                          ? Container(
                              margin: const EdgeInsets.only(left: 40),
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                '${state.loadedUser?.email}',
                                style: const TextStyle(
                                    color: style.Colors.textMain,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                          : EmptyText(),
                      Container(
                        margin: const EdgeInsets.only(left: 40, top: 30),
                        child: const Text(
                          'Класс',
                          style: TextStyle(
                              color: style.Colors.textMain,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      state.loadedUser?.grade != null
                          ? Container(
                              margin: const EdgeInsets.only(left: 40),
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                '${state.loadedUser?.grade}',
                                style: const TextStyle(
                                    color: style.Colors.textMain,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                          : EmptyText(),
                      state.loadedUser?.teacher != null
                          ? Container(
                              margin: const EdgeInsets.only(left: 40, top: 30),
                              padding: const EdgeInsets.only(top: 10),
                              child: const Text(
                                'Классный руководитель',
                                style: TextStyle(
                                    color: style.Colors.textMain,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          : const SizedBox(),
                      state.loadedUser?.teacher != null
                          ? Container(
                              margin: const EdgeInsets.only(left: 40),
                              padding: const EdgeInsets.only(top: 10),
                              child: const Text(
                                'Алиев Иманбек Серикович',
                                style: TextStyle(
                                    color: style.Colors.textMain,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                );
              } //endif

              if (state is UserEmptyState) {
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
