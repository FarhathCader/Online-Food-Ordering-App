// import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserDetail(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userInfoMap);
  }

  UpdateUserwallet(String id, String amount) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .update({"Wallet": amount});
  }

  Future addFoodItem(Map<String, dynamic> userInfoMap, String name) async {
    // return await FirebaseFirestore.instance.collection(name).doc(name).set(userInfoMap);
    return await FirebaseFirestore.instance.collection(name).add(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getFoodItem(String name) async {
    return await FirebaseFirestore.instance.collection(name).snapshots();
  }

  //add foodtocart
  Future addFoodToCart(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .collection("Cart")
        .add(userInfoMap);
  }

  // get foodtocart
  Future<Stream<QuerySnapshot>> getFoodCart(String id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .collection("Cart")
        .snapshots();
  }

  Future<void> deleteFoodFromCart(String userId, String cartItemId) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection("Cart")
        .doc(cartItemId)
        .delete();
  }

  Future<void> updateUserProfile(String userId, String newProfileValue) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .update({'Profile': newProfileValue});
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserByEmail(
      String? email) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection("users")
        .where("Email", isEqualTo: email)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first;
    } else {
      throw Exception("User not found with email: $email");
    }
  }

  //
}
