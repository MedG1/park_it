import 'package:firebase_auth/firebase_auth.dart';

Future<String> signInWithEmailAndPassword(String email, String password) async {
  try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return 'success';
  } on FirebaseAuthException catch (e) {
    return e.code;
  }
}

Future<String> registerWithEmailAndPassword(String email, String password) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    return 'success';
  } on FirebaseAuthException catch (e) {
    return e.code;
  }
}