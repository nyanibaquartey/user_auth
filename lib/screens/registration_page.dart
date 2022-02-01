import 'package:flutter/material.dart';
import 'package:login_app/constants.dart';
import 'package:login_app/components/rounded_button.dart';

class RegistrationPage extends StatefulWidget {
  static const String id = 'registration_page';

  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
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
              height: 10.0,
            ),
            const Text(
              'Register with email',
              style: TextStyle(fontSize: 18.0),
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
            RoundedButton(
              onPressed: () {},
              title: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
