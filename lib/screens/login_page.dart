import 'package:flutter/material.dart';
import 'package:login_app/constants.dart';
import 'package:login_app/components/rounded_button.dart';
import 'package:login_app/screens/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login_page';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  late String email;
  late String password;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Stream<User?> user = FirebaseAuth.instance.authStateChanges();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Form(
          key: _formKey,
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
                'Log in to your account with email',
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(
                height: 25.0,
              ),
              TextFormField(
                controller: emailController,
                onChanged: (value) => email = value,
                //email address must contain "@" sign
                validator: (value) =>
                    !value!.contains('@') ? "Invalid Email" : null,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your email',
                  prefixIcon: const Icon(Icons.email),
                ),
              ),
              const SizedBox(
                height: 21.0,
              ),
              TextFormField(
                controller: passwordController,
                onChanged: (value) => password = value,
                //password must be more than 6 characters
                validator: (value) => value!.length < 6
                    ? "Password  must be above 6 characters"
                    : null,
                obscureText: _obscureText,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password',
                  prefixIcon: const Icon(
                    Icons.lock,
                  ),
                  //toggle password visibility
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
              ),
              // const SizedBox(height: 21.0),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password',
                      style: TextStyle(color: Colors.blue),
                    )),
              ),
              // const SizedBox(height: 21.0),
              RoundedButton(
                onPressed: () async {
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: email, password: password);

                    Navigator.pushNamed(context, Dashboard.id);
                    emailController.clear();
                    passwordController.clear();
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      return showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('User Not Found'),
                          content: const Text('No user found for that email'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Okay'))
                          ],
                        ),
                      );
                    } else if (e.code == 'wrong-password') {
                      return showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Wrong Password'),
                          content: const Text(
                              'Wrong password provided for that user'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Retry'))
                          ],
                        ),
                      );
                    }
                  }
                },
                title: 'Log in',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
