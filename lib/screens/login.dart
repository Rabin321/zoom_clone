import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_method.dart';
import 'package:zoom_clone/widgets/button.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthMothods _authmethods = AuthMothods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Start or join the meeting",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 28),
          child: Image.asset('assets/frontimg.jpg'),
        ),
        CustomButton(
          text: 'Google Sign In',
          onPressed: () async {
            bool res = await _authmethods.signInWithGoogle(context);
            if (res) {
              Navigator.pushReplacementNamed(context, '/home');
            }
          },
        ),
      ],
    ));
  }
}
