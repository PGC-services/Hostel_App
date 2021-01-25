//import 'package:Hostel/core/models/user.dart';
import 'package:Hostel/core/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on FirebaseUser
  Person _personFromFirebasePerson(person) {
    return person != null ? Person(uid: person.uid) : null;
  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      Person person = result.person;
      return person;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with email & password

  // sign in with email & password

  // sign out

}

// class FirebaseUser {

// }
