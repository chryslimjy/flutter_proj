import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project/model/user.dart';
//import 'package:firebase_core_web/firebase_core_web.dart';
import 'database.dart';

class AuthService {
//sign in anon

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user)=> _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

//sign in with email and password


Future loginWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


//update

  Future updateEmailWithPassword(String oldemail, String newemail, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: oldemail, password: password);
      FirebaseUser user = result.user;

      if(user != null){
         _auth.signInWithEmailAndPassword(
          email: oldemail, password: password).then((userCredential) {
        userCredential.user.updateEmail(newemail);

            return _userFromFirebaseUser(user);
      });
     // return _userFromFirebaseUser(user);
    } }catch (e) {
      print(e.toString());
      return null;
    }
  
  }

//sign in anon

  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//register with email and password

  Future registerWithEmailAndPassword(String username, String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

       await DatabaseService(uid: user.uid).updateUserData(username, email, password);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }



// logout

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
