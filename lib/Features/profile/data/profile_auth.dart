import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileAuth {
  Future<void> sendPasswordLink(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
  Future<DocumentSnapshot> getUserData() async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    DocumentSnapshot userData = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    return userData;
  } else {
    throw Exception('No user logged in');
  }
}

}
