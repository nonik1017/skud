import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skud/bloc/user_bloc/user_bloc.dart';
import 'package:skud/bloc/user_bloc/user_event.dart';
import 'package:skud/bloc/user_bloc/user_state.dart';
import 'package:skud/presentation/jorneys/init.dart';
import 'package:skud/presentation/widgets/side_drawer/side_drawer_logo.dart';
import 'package:skud/presentation/widgets/side_drawer/side_drawer_parents.dart';
import 'package:skud/presentation/widgets/side_drawer/side_drawer_profile.dart';
import 'package:skud/presentation/widgets/side_drawer/side_drawer_rights.dart';
import 'package:skud/presentation/widgets/side_drawer/side_drawer_transactions.dart';
import 'package:skud/presentation/widgets/side_drawer/side_drawer_visits.dart';
import 'package:skud/repositories/repositories.dart';

class SideDrawer extends StatefulWidget {
  final String role;
  const SideDrawer({Key? key, required this.role}) : super(key: key);

  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  final LanguageCharacter? _character = LanguageCharacter.ru;
  final userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;

    return BlocProvider<UserBloc>(
      create: (context) =>
          UserBloc(userRepository: userRepository)..add(UserLoadEvent()),
      child: Drawer(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height -
                  padding.top -
                  padding.bottom,
              child: DrawerHeader(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(88, 186, 171, 0.15)),
                child: Column(
                  children: [
                    const SideDrawerLogo(),
                    BlocBuilder<UserBloc, UserState>(builder: (context, state) {
                      if (state is UserLoadedState) {
                        return Container(
                          margin: const EdgeInsets.only(top: 40, left: 10),
                          child: ListTile(
                            leading: Transform.translate(
                              offset: const Offset(0, 7),
                              child: Transform.scale(
                                  scale: 1.6,
                                  child: SvgPicture.asset(
                                    "assets/images/avatar.svg",
                                    width: 40,
                                    height: 40,
                                  )),
                            ),
                            title: const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Здравствуйте,",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color.fromRGBO(22, 14, 78, 1),
                                ),
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                '${state.loadedUser?.firstName} ${state.loadedUser?.lastName}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Color.fromRGBO(22, 14, 78, 1)),
                              ),
                            ),
                          ),
                        );
                      }

                      if (state is UserErrorState) {
                        return Container(
                          margin: const EdgeInsets.only(top: 40, left: 10),
                          child: ListTile(
                            leading: Transform.translate(
                              offset: const Offset(-3, 7),
                              child: Transform.scale(
                                  scale: 1.6,
                                  child: SvgPicture.asset(
                                    "assets/images/avatar.svg",
                                    width: 50,
                                    height: 50,
                                  )),
                            ),
                            title: const Text(
                              "Error",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        );
                      }

                      return Container(
                        margin: const EdgeInsets.only(top: 40, left: 10),
                        child: ListTile(
                          leading: Transform.translate(
                            offset: const Offset(-3, 7),
                            child: Transform.scale(
                                scale: 1.6,
                                child: SvgPicture.asset(
                                  "assets/images/avatar.svg",
                                  width: 50,
                                  height: 50,
                                )),
                          ),
                          title: const Text(
                            "Здравствуйте",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Color.fromRGBO(22, 14, 78, 1),
                            ),
                          ),
                        ),
                      );
                    }),
                    const SideDrawerProfile(),
                    const SideDrawerVists(),
                    const SideDrawerTransactions(),
                    widget.role == 'student'
                        ? const SideDrawerParents()
                        : SizedBox(),
                    const SideDrawerRights(),
                  ],
                ),
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.only(top: 50, left: 25),
            //   child: const Text(
            //     "Язык",
            //     style: TextStyle(
            //       fontWeight: FontWeight.w600,
            //       fontSize: 18,
            //     ),
            //   ),
            // ),
            // Container(
            //   margin: const EdgeInsets.only(top: 15, left: 5),
            //   child: RadioListTile<LanguageCharacter>(
            //     title: const Text(
            //       'English (En)',
            //       style: TextStyle(fontSize: 16),
            //     ),
            //     value: LanguageCharacter.en,
            //     groupValue: _character,
            //     activeColor: const Color.fromRGBO(88, 186, 171, 1),
            //     onChanged: (LanguageCharacter? value) {
            //       setState(() {
            //         _character = value;
            //       });
            //     },
            //   ),
            // ),
            // Container(
            //   margin: const EdgeInsets.only(top: 5, left: 5),
            //   child: RadioListTile<LanguageCharacter>(
            //     title: const Text(
            //       'Русский',
            //       style: TextStyle(fontSize: 16),
            //     ),
            //     value: LanguageCharacter.ru,
            //     groupValue: _character,
            //     activeColor: const Color.fromRGBO(88, 186, 171, 1),
            //     onChanged: (LanguageCharacter? value) {
            //       setState(() {
            //         _character = value;
            //       });
            //     },
            //   ),
            // ),
            // Container(
            //   margin: const EdgeInsets.only(top: 50, left: 25),
            //   child: const Text(
            //     "Помощь",
            //     style: TextStyle(
            //       fontWeight: FontWeight.w600,
            //       fontSize: 18,
            //     ),
            //   ),
            // ),
            // Container(
            //   margin: const EdgeInsets.only(top: 30, left: 25),
            //   child: const Text(
            //     "Служба поддержки",
            //     style: TextStyle(
            //       fontSize: 16,
            //     ),
            //   ),
            // ),
            // Container(
            //   margin: const EdgeInsets.only(top: 30, left: 25),
            //   child: const Text(
            //     "Условия и положения",
            //     style: TextStyle(
            //       fontSize: 16,
            //     ),
            //   ),
            // ),
            // Container(
            //   margin: const EdgeInsets.only(top: 240, left: 25, bottom: 45),
            //   child: const Text(
            //     "© 2021 Все права защищены.",
            //     style: TextStyle(
            //       fontSize: 14,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
