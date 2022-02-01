import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Authentication({this._auth});

  Stream<User?> get authStateChanges => _auth.idTokenChanges();

  Future<String> logIn(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return 'Log in successful';
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }

  Future<String> register(
      {required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return 'Registered succesfully';
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }
}
