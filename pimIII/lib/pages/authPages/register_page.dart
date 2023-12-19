import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pimiii/components/helperFunctions/functions.dart';
import 'package:pimiii/components/login_n_register.dart';
import 'package:pimiii/pages/authPages/login_page.dart';
import 'package:pimiii/pages/home_page.dart';

double heightSpacingLg = 50;
double heightSpacingMd = 15;
double xxlIcon = 60;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static String id = 'register_page';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final verifyPasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void signUp() async {
      final String user = usernameController.text.trim();
      final String password = passwordController.text.trim();
      final String verifyPassword = verifyPasswordController.text.trim();
      final String firstName = firstNameController.text.trim();
      final String lastName = lastNameController.text.trim();

      if (!userCheck(context, user, password,
          firstName: firstName, lastName: lastName)) {
        return;
      }

      if (password != verifyPassword) {
        errorHandler(context, "Passwords do not match");
        return;
      }

      try {
        loader(context);

        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: user,
          password: password,
        );
        await FirebaseFirestore.instance.collection('users').add({
          'firstName': firstName,
          'lastName': lastName,
          'email': user,
          'uid': FirebaseAuth.instance.currentUser!.uid,
        });

        Navigator.pushNamed(context, HomePage.id);
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
                    "Vamos começar, preencha os dados abaixo para criar sua conta",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    ),
                  ),
                  HorizontalSpace(height: heightSpacingMd),
                  Input(
                    obscureText: false,
                    hintText: "Digite o nome",
                    controller: firstNameController,
                    icon: Icons.person,
                  ),
                  HorizontalSpace(height: heightSpacingMd),
                  Input(
                    obscureText: false,
                    hintText: "Digite o sobrenome",
                    controller: lastNameController,
                    icon: Icons.person,
                  ),
                  HorizontalSpace(height: heightSpacingMd),
                  Input(
                    obscureText: false,
                    hintText: "Digite o email",
                    controller: usernameController,
                    icon: Icons.person,
                  ),
                  HorizontalSpace(height: heightSpacingMd),
                  Input(
                    controller: passwordController,
                    obscureText: true,
                    hintText: "Digite a senha",
                    icon: Icons.email,
                  ),
                  const HorizontalSpace(height: 15),
                  Input(
                    controller: verifyPasswordController,
                    obscureText: true,
                    hintText: "Confirme a senha",
                    icon: Icons.lock,
                  ),
                  const HorizontalSpace(height: 30),
                  Button(
                    text: "Cadastrar",
                    function: signUp,
                  ),
                  HorizontalSpace(height: heightSpacingLg),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Já tem uma conta? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, LoginPage.id);
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
