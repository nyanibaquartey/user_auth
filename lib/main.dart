import 'package:flutter/material.dart';

import 'package:login_app/screens/welcome_screen.dart';

void main() {
  runApp(const UserAuth());
}

class UserAuth extends StatelessWidget {
  const UserAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Authentication Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WelcomeScreen(),
    );
  }
}
