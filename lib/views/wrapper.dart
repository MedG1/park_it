import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:park_it/views/login_page.dart';
import 'package:park_it/views/navigation.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FirebaseAuth.instance.currentUser == null ? const LoginPage() : const NavigationPage();
  }
}