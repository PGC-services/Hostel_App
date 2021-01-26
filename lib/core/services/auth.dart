// import 'package:Hostel/core/models/user.dart';
import 'package:Hostel/core/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on FirebaseUser
  Person _personFromFirebaseUser(FirebaseUser person) {
    return person != null ? Person(uid: person.uid) : null;
  }

  //auth change user stream
  Stream<Person> get person {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser person) => _personFromFirebaseUser(person));
        .map(_personFromFirebaseUser);
  }

  // sign in anon
  Future anonymous() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser person = result.user;
      return _personFromFirebaseUser(person);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with email & password

  // sign in with email & password

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
