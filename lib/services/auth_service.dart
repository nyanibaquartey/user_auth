import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  final FirebaseAuth _firebaseAuth;

  Authentication(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<String> logIn(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'Log in successful';
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }

  Future<String> register(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return 'Registered succesfully';
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }
}
