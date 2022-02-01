import 'package:flutter/material.dart';
import 'package:login_app/screens/login_page.dart';
import 'package:login_app/screens/registration_page.dart';
import 'package:login_app/screens/welcome_screen.dart';
import 'package:login_app/screens/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';

//initialize flutterfire so app can use firebase services
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        LoginPage.id: (context) => const LoginPage(),
        RegistrationPage.id: (context) => const RegistrationPage(),
        Dashboard.id: (context) => const Dashboard(),
      },
    );
  }
}
