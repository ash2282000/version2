import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/models/userr.dart';
class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Userr _userFromFirebaseUser(User user) {
    return user != null ? Userr(uid: user.uid) : null;
  }

  Stream<Userr> get user {
    return _auth.authStateChanges().map((User user) =>
        _userFromFirebaseUser(user));
  }

  Future signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user).uid;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  Future signUp(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user).uid;
    } on FirebaseAuthException catch(e)  {
      if(e.code == 'weak-password') {
        print('The password entered is too weak');
      } else if(e.code == 'email-already-in-use'){
        print('An account already exists for the entered email');
      }
      return null;
    } catch(e){
      print(e.toString());
      return null;
    }
  }
  Future signOut() async {
    try {
      return await _auth.signOut();
    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }
}