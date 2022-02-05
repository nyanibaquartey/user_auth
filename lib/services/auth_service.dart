import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_app/user_model.dart';

class Authentication {
  final FirebaseAuth _firebaseAuth;

  Authentication(this._firebaseAuth);

//map user data from firebase to appuser class
  AppUser? _userFromFirebase(User? user) {
    if (user == null) {
      return null;
    }
    return AppUser(uid: user.uid, email: user.email);
  }

//manage user state and get a stream of users
  Stream<AppUser?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

//Log in user
  Future<String> logIn(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'Log in successful';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return "No user found for that email.";
      } else if (e.code == 'wrong-password') {
        return "Wrong password provided for that user.";
      } else {
        return "Something Went Wrong.";
      }
    }
  }

  Future<String> register(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return 'Registered succesfully';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return "Weak password";
      } else if (e.code == 'email-already-in-use') {
        return "The account already exists for that email.";
      } else {
        return "Something Went Wrong.";
      }
    }
  }

  //sign out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
