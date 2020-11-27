import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> database(String displayName, String email) async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  users.add({'displayName': displayName, 'uid': uid, 'email': email});
}
