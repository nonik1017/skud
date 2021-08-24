import 'package:flutter/material.dart';
import 'package:skud/pages/parents.dart';
import 'package:skud/widgets/side_drawer.dart';

class InitApp extends StatefulWidget {
  const InitApp({Key? key}) : super(key: key);

  @override
  InitState createState() => InitState();
}

enum LanguageCharacter { en, ru }

class InitState extends State<InitApp> {
  final LanguageCharacter? _character = LanguageCharacter.ru;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: Builder(
          builder: (context) => Scaffold(
              appBar: AppBar(
                elevation: 0,
                centerTitle: true,
                backgroundColor: Colors.white,
                iconTheme: const IconThemeData(color: Colors.black, size: 40),
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
              body: const ParentsApp())),
    );
  }
}
