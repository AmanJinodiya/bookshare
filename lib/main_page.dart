import 'package:book/authentication/auth_page.dart';
import 'package:book/authentication/login.dart';
import 'package:book/authentication/login_signup.dart';
import 'package:book/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class main_page extends StatefulWidget {
  const main_page({super.key});

  @override
  State<main_page> createState() => _main_pageState();
}

class _main_pageState extends State<main_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("logged in");
            return home_page();
          } else {
            print("not logged in");
            return authPage();
          }
        },
      ),
    );
  }
}
