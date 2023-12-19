import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String img =
        'https://ca.slack-edge.com/T05FFAA91JP-U05R9QK0G69-8062802f098f-512';

    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/pii.jpg'),
              ),
              const Text(
                "Prosper Pii",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontFamily: 'Pacifico',
                    letterSpacing: 2),
              ),
              SizedBox(
                height: 10,
                child: Container(),
              ),
              Text(
                "FLUTTER DEVELOPER",
                style: TextStyle(
                    fontFamily: 'Source',
                    color: Colors.teal[200],
                    letterSpacing: 2.5,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 20,
                child: Divider(
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: 10,
                child: Container(),
              ),
              const Card(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text("+123456789",
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 20,
                          fontFamily: 'Source',
                          fontWeight: FontWeight.w600)),
                ),
              ),
              SizedBox(
                height: 10,
                child: Container(),
              ),
              const Card(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                  title: Text(
                    "piinoya@gmail.com",
                    style: TextStyle(
                        color: Colors.teal,
                        fontSize: 20,
                        fontFamily: 'Source',
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
