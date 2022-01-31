import 'package:flutter/material.dart';
import 'package:login_app/screens/login_page.dart';

void main() {
  runApp(const UserAuth());
}

class UserAuth extends StatelessWidget {
  const UserAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Log In App Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(title: 'Log In App'),
    );
  }
}
