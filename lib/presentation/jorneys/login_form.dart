import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skud/bloc/login_bloc/login_bloc.dart';
import 'package:skud/presentation/themes/theme.dart' as style;
import 'package:skud/repositories/repositories.dart';

class LoginForm extends StatefulWidget {
  final UserRepository userRepository;
  const LoginForm({key, required this.userRepository}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState(userRepository);
}

class _LoginFormState extends State<LoginForm> {
  final UserRepository userRepository;
  _LoginFormState(this.userRepository);
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          username: _usernameController.text,
          password: _passwordController.text,
        ),
      );
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Login failed."),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 80.0),
            child: Form(
              child: Column(
                children: [
                  Container(
                      height: 200.0,
                      padding: const EdgeInsets.only(bottom: 20.0, top: 40.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 36,
                            width: 112,
                            child: Image.asset(
                              'assets/images/logo_white.png',
                              height: 24,
                              width: 24,
                            ),
                          ),
                          const SizedBox(
                            height: 45.0,
                          ),
                          const Center(
                            child: Text(
                              "?????????????? ?? ???????? \n?????????????? ????????????",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  // color: style.Colors.mainColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    style: const TextStyle(
                        fontSize: 14.0,
                        color: style.Colors.titleColor,
                        fontWeight: FontWeight.bold),
                    controller: _usernameController,
                    // keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      // prefixIcon: const Icon(EvaIcons.emailOutline,
                      //     color: Colors.black26),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(8.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: style.Colors.mainColor),
                          borderRadius: BorderRadius.circular(8.0)),
                      contentPadding:
                          const EdgeInsets.only(left: 10.0, right: 10.0),
                      // labelText: "?????????????? ?????? ??????????",
                      hintText: "?????????????? ?????? ??????????",
                      hintStyle: const TextStyle(
                          fontSize: 12.0,
                          color: style.Colors.grey,
                          fontWeight: FontWeight.w500),
                      labelStyle: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                    autocorrect: false,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    style: const TextStyle(
                        fontSize: 14.0,
                        color: style.Colors.titleColor,
                        fontWeight: FontWeight.bold),
                    controller: _passwordController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      // prefixIcon: const Icon(
                      //   EvaIcons.lockOutline,
                      //   color: Colors.black26,
                      // ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(8.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: style.Colors.mainColor),
                          borderRadius: BorderRadius.circular(8.0)),
                      contentPadding:
                          const EdgeInsets.only(left: 10.0, right: 10.0),
                      hintText: "????????????",
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _passwordVisible = _passwordVisible ? false : true;
                          });
                        },
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                      hintStyle: const TextStyle(
                          fontSize: 12.0,
                          color: style.Colors.grey,
                          fontWeight: FontWeight.w500),
                      labelStyle: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                    autocorrect: false,
                    obscureText: !_passwordVisible,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                          height: 45,
                          child: state is LoginLoading
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Center(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        SizedBox(
                                          height: 25.0,
                                          width: 25.0,
                                          child: CupertinoActivityIndicator(),
                                        )
                                      ],
                                    ))
                                  ],
                                )
                              : RaisedButton(
                                  color: style.Colors.mainColor,
                                  disabledColor: style.Colors.mainColor,
                                  disabledTextColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  onPressed: _onLoginButtonPressed,
                                  child: const Text(
                                    "??????????",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
