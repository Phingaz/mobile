import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pimiii/components/constanst.dart';
import 'package:pimiii/components/helperFunctions/functions.dart';
import 'package:pimiii/components/login_n_register.dart';
import 'package:pimiii/pages/authPages/forgot_password.dart';
import 'package:pimiii/pages/authPages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String id = 'login_page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double heightSpacingLg = 50;
    double heightSpacingMd = 15;
    double xxlIcon = 100;

    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    void signIn() async {
      String user = usernameController.text;
      String password = passwordController.text;
      if (!userCheck(context, user, password)) return;
      try {
        loader(context);
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: user, password: password);
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        if (e.code == 'user-not-found') {
          errorHandler(context, 'No user found for that email.');
        } else if (e.code == 'wrong-password') {
          errorHandler(context, 'Wrong password provided for that user.');
        } else if (e.code == 'invalid-email') {
          errorHandler(context, "The email address is invalid");
        } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
          errorHandler(context, "Email or password is incorrect");
        } else {
          errorHandler(context, e.code);
        }
      } catch (error) {
        errorHandler(context, "An unexpected error occurred.");
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
                  Icon(
                    Icons.lock,
                    size: xxlIcon,
                  ),
                  HorizontalSpace(height: heightSpacingLg),
                  Text(
                    "Ben-vindo(a) de volta!",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    ),
                  ),
                  HorizontalSpace(height: heightSpacingMd),
                  Input(
                    obscureText: false,
                    hintText: "Digite o email",
                    controller: usernameController,
                    icon: Icons.email,
                  ),
                  HorizontalSpace(height: heightSpacingMd),
                  Input(
                    controller: passwordController,
                    obscureText: true,
                    hintText: "Digite a senha",
                    icon: Icons.lock,
                  ),
                  const HorizontalSpace(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPassword()));
                        },
                        child: Text(
                          "Esqueci minha senha",
                          style: lightGrey,
                        ),
                      )
                    ],
                  ),
                  const HorizontalSpace(height: 30),
                  Button(
                    text: "Login",
                    function: signIn,
                  ),
                  HorizontalSpace(height: heightSpacingLg),
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
