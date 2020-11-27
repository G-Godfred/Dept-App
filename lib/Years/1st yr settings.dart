import 'package:cloud_firestore/cloud_firestore.dart';

class AddUser {
  final String username;
  final String email;
  //final String level

  AddUser({this.username, this.email});

  CollectionReference users = FirebaseFirestore.instance.collection('users');
}
