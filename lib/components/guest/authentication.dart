import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Authentication {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future login(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

     return user != null ? true : throw new Exception('User Not Found');
    } catch (error){
      print(error);
    }    
  }

  static Future register(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return result;
    } catch (error){
      print(error);
    }
  }

  static Future resetPassword(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch(error) {
      print(error);
    } 
  }

  static Future logout() async {
    try {
      return await _auth.signOut();
    } catch(error) {
      print(error);
    }
  }
}