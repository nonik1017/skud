import 'package:flutter/material.dart';
import 'package:skud/presentation/jorneys/profile.dart';

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
      home: Builder(builder: (context) => Scaffold(body: const ProfileApp())),
    );
  }
}
