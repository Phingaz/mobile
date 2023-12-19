import 'package:flutter/material.dart';

void errorHandler(BuildContext context, String message) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("An error occured"),
          content: Text(message),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"))
          ],
        );
      });
}

void loader(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => const Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.white,
            color: Colors.black,
          )));
}

bool userCheck(BuildContext context, String user, String password, {String? firstName, String? lastName}) {
  if (user.isEmpty ||
      !user.contains("@") ||
      !user.contains(".") ||
      user.length < 3) {
    errorHandler(context, "Please enter a valid email");
    return false;
  }
  if (password.isEmpty || password.length < 6) {
    errorHandler(context, "Password must be greater than 6 characters");
    return false;
  }
  if (firstName != null && firstName.isEmpty) {
    errorHandler(context, "Please enter your first name");
    return false;
  }
  if (lastName != null && lastName.isEmpty) {
    errorHandler(context, "Please enter your last name");
    return false;
  }
  return true;
}

