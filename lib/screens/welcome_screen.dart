import 'package:flutter/material.dart';
import 'package:login_app/screens/login_page.dart';
import 'package:login_app/screens/registration_page.dart';
import 'package:login_app/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Welcome to Greatly\'s App,',
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20.0,
            ),
            RoundedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationPage.id);
                },
                title: 'Register'),
            // const SizedBox(
            // height: 21.0,
            //),
            RoundedButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginPage.id);
                },
                title: 'Log in')
          ],
        ),
      ),
    );
  }
}
