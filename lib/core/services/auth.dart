// import 'package:Hostel/core/models/user.dart';
import 'package:Hostel/core/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on FirebaseUser
  Person _personFromFirebaseUser(User person) {
    return person != null ? Person(uid: person.uid) : null;
  }

  //auth change user stream
  Stream<Person> get person {
    return _auth.authStateChanges()
        //.map((FirebaseUser person) => _personFromFirebaseUser(person));
        .map(_personFromFirebaseUser);
  }

  // sign in anon
  Future anonymous() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User person = result.user;
      return _personFromFirebaseUser(person);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with email & password
  Future signUpwithEmailandPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User person = result.user;
      return _personFromFirebaseUser(person);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email & password
  Future signInWithEmailandPassword(String email, String pass) async {
    try {
      UserCredential result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      User person = result.user;
      return _personFromFirebaseUser(person);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future logout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
