import 'package:flutter/material.dart';
import 'package:login_app/constants.dart';
import 'package:login_app/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_app/screens/dashboard.dart';

class RegistrationPage extends StatefulWidget {
  static const String id = 'registration_page';

  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    // final authService = Provider.of<Authentication>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
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
                'Register with email',
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(
                height: 25.0,
              ),
              TextFormField(
                onChanged: (value) => email = value,
                //email must contain "@"
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
                onChanged: (value) => password = value,
                //password must be more than 6 characters
                validator: (value) => value!.length < 6
                    ? "Password must be above 6 characters"
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
              const SizedBox(height: 21.0),
              RoundedButton(
                onPressed: () async {
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: email, password: password);
                    Navigator.pushNamed(context, Dashboard.id);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      return showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                                title: const Text('Weak Password'),
                                content:
                                    const Text('The password provided is weak'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Retry'))
                                ],
                              ));
                    } else if (e.code == 'email-already-in-use') {
                      return showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Email Already Exists'),
                          content: const Text(
                              'The email provided is already in use'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Dismiss'))
                          ],
                        ),
                      );
                    }
                  } catch (e) {
                    return showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Error'),
                        content: Text(e.toString()),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Ok'))
                        ],
                      ),
                    );
                  }
                },
                title: 'Register',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
