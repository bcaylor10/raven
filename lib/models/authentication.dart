import 'package:firebase_auth/firebase_auth.dart';
import './user.dart';

class Authentication {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user) {
    return user != null ? User(id: user.uid) : null;
  }

  Future login(String email, String password) async {
    AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;

    return _userFromFirebase(user);  
  }

  Future register(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      
      return _userFromFirebase(user);
    } catch (error){
      print(error);
    }
  }

  Future resetPassword(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch(error) {
      print(error);
    } 
  }

  Future logout() async {
    try {
      return await _auth.signOut();
    } catch(error) {
      print(error);
    }
  }
}