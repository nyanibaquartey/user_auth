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
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your email',
                prefixIcon: const Icon(Icons.email),
              ),
            ),
            const SizedBox(
              height: 20.0,
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
          ],
        ),
      ),
    );
  }
}
