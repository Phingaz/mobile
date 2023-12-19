import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pimiii/pages/authPages/login_page.dart';
import 'package:pimiii/pages/home_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});
  static String id = 'auth_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomePage();
            } else {
              return const LoginPage();
            }
          }),
    );
  }
}
