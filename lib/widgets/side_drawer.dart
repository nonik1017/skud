import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skud/init.dart';
import 'package:skud/pages/profile.dart';
import 'package:skud/pages/transactions.dart';
import 'package:skud/pages/visits.dart';

class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  LanguageCharacter? _character = LanguageCharacter.ru;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 500,
            child: DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(88, 186, 171, 0.15)),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 10),
                    child: ListTile(
                      leading: Container(
                        height: 36,
                        width: 112,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(22, 14, 78, 0.05),
                        ),
                      ),
                      trailing: IconButton(
                        padding: const EdgeInsets.only(right: 1),
                        icon: const Icon(
                          Icons.close,
                          size: 30,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      // onTap: (){}
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 40, left: 10),
                    child: ListTile(
                      leading: Transform.translate(
                        offset: const Offset(0, 8),
                        child: Transform.scale(
                          scale: 1.6,
                          child: Image.asset(
                            'assets/images/avatar.png',
                            height: 70,
                            width: 70,
                          ),
                        ),
                      ),
                      title: const Text(
                        "Здравствуйте,",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color.fromRGBO(22, 14, 78, 1),
                        ),
                      ),
                      subtitle: const Text(
                        "Омарова Зауре",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color.fromRGBO(22, 14, 78, 1)),
                      ),
                      // trailing: Icon(Icons.arrow_back),
                      // onTap: (){}
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 50, left: 10),
                    child: ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(context,
                            CupertinoPageRoute(builder: (_) => ProfileApp()));
                      },
                      leading: Image.asset(
                        'assets/images/user.png',
                        height: 24,
                        width: 24,
                      ),
                      title: Transform.translate(
                        offset: const Offset(-10, 0),
                        child: const Text(
                          "Личный кабинет",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color.fromRGBO(22, 14, 78, 1),
                          ),
                        ),
                      ),
                      // trailing: Icon(Icons.arrow_back),
                      // onTap: (){}
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 10),
                    child: ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(context,
                            CupertinoPageRoute(builder: (_) => VisitsApp()));
                      },
                      leading: Image.asset(
                        'assets/images/location.png',
                        height: 24,
                        width: 24,
                      ),
                      title: Transform.translate(
                        offset: const Offset(-10, 0),
                        child: const Text(
                          "Мои посещения",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color.fromRGBO(22, 14, 78, 1),
                          ),
                        ),
                      ),
                      // trailing: Icon(Icons.arrow_back),
                      // onTap: (){}
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 10),
                    child: ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (_) => TransactionsApp()));
                      },
                      leading: Image.asset(
                        'assets/images/wallet.png',
                        height: 24,
                        width: 24,
                      ),
                      title: Transform.translate(
                        offset: const Offset(-10, 0),
                        child: const Text(
                          "Мои транзакции",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color.fromRGBO(22, 14, 78, 1),
                          ),
                        ),
                      ),
                      // trailing: Icon(Icons.arrow_back),
                      // onTap: (){}
                    ),
                  ),

                  // Container(
                  //   margin: const EdgeInsets.only(top: 10, left: 10),
                  //   child: ListTile(
                  //     leading: Image.asset(
                  //       'assets/images/shopbasket.png',
                  //       height: 24,
                  //       width: 24,
                  //     ),
                  //     title: Transform.translate(
                  //       offset: const Offset(-10, 0),
                  //       child: const Text(
                  //       "Заказы",
                  //       style: TextStyle(
                  //           fontWeight: FontWeight.w600,
                  //           fontSize: 18,
                  //           color: Color.fromRGBO(22, 14, 78, 1),
                  //         ),
                  //       ),
                  //     ),
                  //     // trailing: Icon(Icons.arrow_back),
                  //     // onTap: (){}
                  //   ),
                  // ),

                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 10),
                    child: ListTile(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      leading: Image.asset(
                        'assets/images/parents.png',
                        height: 24,
                        width: 24,
                      ),
                      title: Transform.translate(
                        offset: const Offset(-10, 0),
                        child: const Text(
                          "Список родителей",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color.fromRGBO(22, 14, 78, 1),
                          ),
                        ),
                      ),
                      // trailing: Icon(Icons.arrow_back),
                      // onTap: (){}
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50, left: 25),
            child: const Text(
              "Язык",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15, left: 5),
            child: RadioListTile<LanguageCharacter>(
              title: const Text(
                'English (En)',
                style: TextStyle(fontSize: 16),
              ),
              value: LanguageCharacter.en,
              groupValue: _character,
              activeColor: const Color.fromRGBO(88, 186, 171, 1),
              onChanged: (LanguageCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5, left: 5),
            child: RadioListTile<LanguageCharacter>(
              title: const Text(
                'Русский',
                style: TextStyle(fontSize: 16),
              ),
              value: LanguageCharacter.ru,
              groupValue: _character,
              activeColor: const Color.fromRGBO(88, 186, 171, 1),
              onChanged: (LanguageCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50, left: 25),
            child: const Text(
              "Помощь",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30, left: 25),
            child: const Text(
              "Служба поддержки",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30, left: 25),
            child: const Text(
              "Условия и положения",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 75, left: 25, bottom: 45),
            child: const Text(
              "© 2021 Все права защищены.",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}