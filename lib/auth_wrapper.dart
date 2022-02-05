import 'package:flutter/material.dart';
import 'package:login_app/screens/welcome_screen.dart';
import 'package:login_app/services/auth_service.dart';
import 'package:login_app/user_model.dart';
import 'package:provider/provider.dart';
import 'package:login_app/screens/login_page.dart';
import 'package:login_app/screens/dashboard.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);
  static const String id = 'wrapper';

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<Authentication>(context);

    return StreamBuilder<AppUser?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<AppUser?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          AppUser? user = snapshot.data;
          return user == null ? const WelcomeScreen() : const Dashboard();
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
