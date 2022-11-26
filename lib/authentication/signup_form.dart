import 'package:book/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class signup_form extends StatelessWidget {
  signup_form({super.key});

  final _email = TextEditingController();
  final _password = TextEditingController();
  final _cnfmpass = TextEditingController();

  Future create_acc() async {
    if (PasswordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text.trim(), password: _password.text.trim());
    }
  }

  bool PasswordConfirmed() {
    if (_cnfmpass.text.trim() == _password.text.trim()) return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _email,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Email',
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextFormField(
                obscureText: true,
                controller: _password,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                    suffixIcon: IconButton(
                        onPressed: null,
                        icon: Icon(Icons.remove_red_eye_rounded))),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextFormField(
                obscureText: true,
                controller: _cnfmpass,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Confirm Password',
                    suffixIcon: IconButton(
                        onPressed: null,
                        icon: Icon(Icons.remove_red_eye_rounded))),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: null,
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                color: Colors.blue[300],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 214, 181, 132))),
                  onPressed: create_acc,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 20),
                    ),
                  ))),
        ),
      ],
    ));
  }
}
