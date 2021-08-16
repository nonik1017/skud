import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthorizationApp extends StatefulWidget {
  const AuthorizationApp({Key? key}) : super(key: key);

  @override
  _AuthorizationState createState() => _AuthorizationState();
}

class _AuthorizationState extends State<AuthorizationApp> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(scaffoldBackgroundColor: Colors.grey[200]),
      home: Builder(
        builder: (context) => Scaffold(
          body: Center(
            child: Column(
              children: <Widget>[
                Container(
                  height: 36,
                  width: 112,
                  margin: const EdgeInsets.only(top: 50, left: 104, right: 104),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(top: 50, left: 27, right: 27),
                  width: 240,
                  child: const Text(
                    'Войдите в свою учетную запись',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                Container(
                  height: 46,
                  margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
                  padding: const EdgeInsets.only(top: 7, left: 12),
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: const Color.fromRGBO(88, 186, 171, 1)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Введите ваш email',
                      isDense: true,              // Added this
                      focusedBorder: InputBorder.none,        
                      contentPadding: EdgeInsets.only(top: 10, left: 5),  // Added this
                    ),
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color.fromRGBO(28, 28, 32, 1)
                    ),
                    // validator: (value) => EmailValidator.validate(value) ? null : "Please enter a valid email",
                  ),
                ),

                Container(
                  height: 46,
                  margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  padding: const EdgeInsets.only(top: 7, left: 12),
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: const Color.fromRGBO(88, 186, 171, 1)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: !passwordVisible,//This will obscure text dynamically
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Пароль',
                      isDense: true,              // Added this
                      focusedBorder: InputBorder.none,        
                      contentPadding: const EdgeInsets.only(top: 10, left: 5),  // Added this
                      suffixIcon: IconButton(
                        padding: const EdgeInsets.only(bottom: 5),
                        icon: Icon(
                          passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                          color: const Color.fromRGBO(88, 186, 171, 1),
                        ),
                        onPressed: () {
                          setState(() {
                              passwordVisible = !passwordVisible;
                          });
                        },
                      ),
                    ),
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color.fromRGBO(28, 28, 32, 1)
                    ),
                  ),
                ),

                Container(
                  height: 46,
                  width: 280,
                  margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(88, 186, 171, 1),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: const Center(
                    child: Text(
                      'Войти',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color.fromRGBO(255, 255, 255, 1)
                      ),
                    ),
                  )
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}