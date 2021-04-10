import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService(this.uid);

  final CollectionReference studentCollection =
      FirebaseFirestore.instance.collection('Students');

  Future updateUserData(String name, String email, int contact) async {
    return await studentCollection.doc(uid).set({
      'name': name,
      'email': email,
      'contact': contact,
    });
  }
}
