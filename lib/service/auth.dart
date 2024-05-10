import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/service/database.dart';
import 'package:flutter_application_1/service/shared_pref.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  getCurrentUser() async {
    return await _auth.currentUser;
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
    await SharedPreferenceHelper().clearAllPreferences();
    // await SharedPreferenceHelper().saveUserProfile(null);
  }

  Future deleteUser() async {
    User? user = await FirebaseAuth.instance.currentUser;
    var user2 = await DatabaseMethods().getUserByEmail(user?.email);
    await SharedPreferenceHelper().clearAllPreferences();
    deleteUserFromFirestore(user2.id);
  }

  void deleteUserFromFirestore(String? userId) async {
    await FirebaseFirestore.instance.collection('users').doc(userId).delete();
  }
}
