import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updateUser(String uid, String username) async {
  return await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'name': username
    });
}