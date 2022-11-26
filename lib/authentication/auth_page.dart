import 'package:book/authentication/login.dart';
import 'package:book/authentication/signup.dart';
import 'package:flutter/material.dart';

class authPage extends StatefulWidget {
  const authPage({super.key});

  @override
  State<authPage> createState() => _authPageState();
}

class _authPageState extends State<authPage> {
  bool showLogin = true;

  void toggleScreen() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return login(showRegisterPage: toggleScreen);
    } else {
      return signup(showLoginPage: toggleScreen);
    }
  }
}
