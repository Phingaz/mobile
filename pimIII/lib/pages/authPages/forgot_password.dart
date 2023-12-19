// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pimiii/components/helperFunctions/functions.dart';
import 'package:pimiii/components/login_n_register.dart';
import 'package:pimiii/pages/authPages/login_page.dart';
import 'package:pimiii/pages/authPages/register_page.dart';

const double heightSpacingLg = 50;
const double heightSpacingMd = 15;

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  static String id = 'forgot_password';

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void signIn() async {
      final String email = emailController.text.trim();

      if (email.isEmpty ||
          !email.contains("@") ||
          !email.contains(".") ||
          email.length < 3) {
        errorHandler(context, "Please enter a valid email");
        return;
      }

      try {
        loader(context);
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Success"),
                content: const Text('E-mail de redefinição de senha enviado'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, LoginPage.id);
                      },
                      child: const Text("OK"))
                ],
              );
            });
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        errorHandler(context, e.code);
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Recuperar senha",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: heightSpacingLg),
                  Input(
                    obscureText: false,
                    hintText: "Digite o email",
                    controller: emailController,
                    icon: Icons.lock,
                  ),
                  const SizedBox(height: heightSpacingMd),
                  Button(
                    text: "Recuperar Senha",
                    function: signIn,
                  ),
                  const SizedBox(height: heightSpacingLg),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Não tenho uma conta? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RegisterPage.id);
                        },
                        child: const Text(
                          "Cadastrar",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
