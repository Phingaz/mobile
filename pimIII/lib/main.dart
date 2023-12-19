import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pimiii/pages/authPages/auth_page.dart';
import 'package:pimiii/pages/authPages/forgot_password.dart';
import 'package:pimiii/pages/authPages/login_page.dart';
import 'package:pimiii/pages/authPages/register_page.dart';
import 'package:pimiii/pages/demonstrativo.dart';
import 'package:pimiii/pages/holerite.dart';
import 'package:pimiii/pages/home_page.dart';
import 'package:pimiii/pages/perfil.dart';
import 'package:pimiii/pages/tela_de_relatorios.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AuthPage.id,
      routes: {
        AuthPage.id: (context) => const AuthPage(),
        ForgotPassword.id: (context) => ForgotPassword(),
        HomePage.id: (context) => const HomePage(),
        LoginPage.id: (context) => const LoginPage(),
        RegisterPage.id: (context) => const RegisterPage(),
        Holerite.id: (context) => const Holerite(),
        Demonstrativo.id: (context) => const Demonstrativo(),
        Perfil.id: (context) => const Perfil(),
        MyTable.id: (context) => MyTable(),
      },
    );
  }
}
