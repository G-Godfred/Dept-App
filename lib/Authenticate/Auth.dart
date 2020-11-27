import 'package:firebase_auth/firebase_auth.dart';
import 'package:Practice/Authenticate/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User _userFromFirebaseUser(User user) {
    return user != null ? Use(uid: user.uid) : Null;
  }

  // auth change user

  Stream<User> get user {
    return _auth.authStateChanges();
  }

  // Register with Email amd password

  Future signUp(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString);
      return null;
    }
  }

  // log out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signIn(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
