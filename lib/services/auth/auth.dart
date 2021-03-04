import 'package:firebase_auth/firebase_auth.dart';
import 'package:tkz/services/database/database.dart';
import 'package:tkz/services/database/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TrzUser _userFromFirebase(User _user) {
    return _user != null ? TrzUser(userUid: _user.uid) : null;
  }

  Future getCurrentUser() {}
  //Sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      TrzUser trzUser = _userFromFirebase(user);
      return trzUser;
    } catch (e) {
      print(e.toString());
      print("You tried, and then it fail. So unfair... try again!");
      return null;
    }
  }

  //Register with email and password
  Future registerWithEmailAndPassword(TrzUser trzUser) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: trzUser.userEmail, password: trzUser.userPassword);

      User user = result.user;

      trzUser.userUid = user.uid;

      await DatabaseService(uid: trzUser.userUid).setUserAttribute(trzUser);

      return trzUser;
    } catch (e) {
      print(e.toString());
      print("You tried, and then it fail. So unfair... try again!");
      return null;
    }
  }
}
