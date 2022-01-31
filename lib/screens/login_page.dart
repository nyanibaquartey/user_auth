import 'package:flutter/material.dart';
import 'package:login_app/constants.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, required this.title}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Welcome to Greatly\'s App,',
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'Log in to your account with email',
            ),
            const SizedBox(
              height: 25.0,
            ),
            TextField(
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your email',
                prefixIcon: const Icon(Icons.email),
              ),
            ),
            const SizedBox(
              height: 21.0,
            ),
            TextField(
              obscureText: true,
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your password',
                prefixIcon: const Icon(
                  Icons.password,
                ),
              ),
            ),
            const SizedBox(height: 21.0),
            SizedBox(
              height: 50.0,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20.0),
                    elevation: 3.0,
                    side: const BorderSide(
                        style: BorderStyle.solid,
                        color: Colors.blue,
                        width: 2.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text('Log in')),
            ),
          ],
        ),
      ),
    );
  }
}
