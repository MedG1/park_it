import 'package:flutter/material.dart';
import 'package:park_it/services/auth_services.dart';
import 'package:park_it/views/navigation.dart';
import 'package:park_it/views/registration_page.dart';
import '../components/auth_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                    child: Image.asset('assets/login_bg.png'),
                  ),
                ],
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'Log in to continue',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Color(0xFF5D89FA),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            AuthTextField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              hintText: 'e-mail address',
              leadingIcon: const Icon(
                Icons.email_outlined,
              ),
            ),
            AuthTextField(
              controller: _passwordController,
              hintText: 'password',
              obscureText: true,
              leadingIcon: const Icon(
                Icons.lock_outline,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_emailController.text.isEmpty ||
                    _passwordController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(_buildSnackBar(
                      'Please enter both your email and password'));
                } else {
                  String authRes = await signInWithEmailAndPassword(
                      _emailController.text, _passwordController.text);
                  if (authRes == 'success') {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NavigationPage()));
                  } else if (authRes == 'user-not-found' ||
                      authRes == 'wrong-password') {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(_buildSnackBar('Wrong credentials'));
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(_buildSnackBar(authRes));
                  }
                }
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: Text(
                  'Log in',
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
            const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account? '),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SignupPage()));
                  },
                  child: const Text('sign up',
                      style: TextStyle(color: Color(0xFF5D89FA))),
                ),
                const Text(',it\'s free!'),
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
}
