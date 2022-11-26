import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class login_form extends StatefulWidget {
  const login_form({
    Key? key,
  }) : super(key: key);

  @override
  State<login_form> createState() => _login_formState();
}

class _login_formState extends State<login_form> {
  @override
  Widget build(BuildContext context) {
    final _email = TextEditingController();
    final _password = TextEditingController();

    Future login_function() async {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text.trim(), password: _password.text.trim());
    }

    @override
    dispose() {
      _email.dispose();
      _password.dispose();
      super.dispose();
    }

    return Form(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextFormField(
                controller: _email,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: 'Email'),
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
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: null,
            child: Text('Forgot Password?',
                style: TextStyle(
                  color: Colors.blue[300],
                )),
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
                  onPressed: login_function,
                  child: const Text('Login'))),
        )
      ],
    ));
  }
}
