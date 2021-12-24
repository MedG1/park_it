import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:park_it/services/auth_services.dart';
import 'package:park_it/services/database.dart';
import 'package:park_it/views/login_page.dart';
import 'package:park_it/views/navigation.dart';
import '../components/auth_text_field.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.none,
              width: size.width,
              height: size.height * 0.5,
              child: Stack(
                children: [
                  Positioned(
                    width: size.width + 5,
                    height: size.height * 0.5,
                    top: 0,
                    left: 0,
                    child: Container(
                      clipBehavior: Clip.none,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/signup_bg.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.15,
                    left: size.width * 0.1,
                    width: size.width * 0.8,
                    child: Image.asset('assets/register_bg.png'),
                  ),
                ],
              ),
            ),
            AuthTextField(
              keyboardType: TextInputType.emailAddress,
              hintText: 'e-mail',
              leadingIcon: const Icon(Icons.email_outlined),
              controller: _emailController,
            ),
            AuthTextField(
              hintText: 'User name',
              leadingIcon: const Icon(Icons.person),
              controller: _usernameController,
            ),
            AuthTextField(
              obscureText: true,
              hintText: 'password',
              leadingIcon: const Icon(Icons.lock_outline),
              controller: _passwordController,
            ),
            AuthTextField(
              obscureText: true,
              hintText: 'confirm password',
              leadingIcon: const Icon(Icons.lock_outline),
              controller: _confirmPassController,
            ),
            ElevatedButton(
              onPressed: () async {
                if(_confirmPassController.text != _passwordController.text){
                  ScaffoldMessenger.of(context).showSnackBar(_buildSnackBar('Passwords do not match'));
                } else if(!isValidEmail(_emailController.text)){
                  ScaffoldMessenger.of(context).showSnackBar(_buildSnackBar('Invalid email format'));
                } else {
                  String authRes = await registerWithEmailAndPassword(  _emailController.text, _passwordController.text);
                  try {
                    updateUser(FirebaseAuth.instance.currentUser!.uid, _usernameController.text);
                  } on FirebaseAuthException catch(e){
                    print(e.code);
                  }
                  if (authRes == 'success') {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const NavigationPage()));
                  } else if (authRes == 'email-already-in-use') {
                    ScaffoldMessenger.of(context).showSnackBar(_buildSnackBar('Email already in use'));
                  } else if (authRes == 'weak-password') {
                    ScaffoldMessenger.of(context).showSnackBar(_buildSnackBar('Weak password, try again'));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(_buildSnackBar(authRes));
                  }
                }
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: Text(
                  'Sign up',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFF5D89FA)),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account? '),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: const Text('sign in',
                        style: TextStyle(color: Color(0xFF5D89FA)))),
                const Text('instead'),
              ],
            )
          ],
        ),
      ),
    );
  }

  SnackBar _buildSnackBar(String msg) {
    return SnackBar(
      content: Text(msg),
    );
  }

  bool isValidEmail(value) {
    const pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
    final regExp = RegExp(pattern);
    if (value.isEmpty || !regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }
}
