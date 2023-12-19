import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pimiii/components/login_n_register.dart';
import 'package:pimiii/pages/authPages/auth_page.dart';
import 'package:pimiii/pages/holerite.dart';
import 'package:pimiii/pages/perfil.dart';
import 'package:pimiii/pages/tela_de_relatorios.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;

String firstName = "";
String lastName = "";
String email = "";

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamed(context, AuthPage.id);
  }

  void folha() async {
    Navigator.pushNamed(context, Holerite.id);
  }

  void relatorio() async {
    Navigator.pushNamed(context, MyTable.id);
  }

  void perfil() async {
    Navigator.pushNamed(context, Perfil.id);
  }

  Future<dynamic> getUser() async {
    String? userUid = await FirebaseAuth.instance.currentUser?.uid;
    if (userUid == null) return;
    final QuerySnapshot userQuerySnapshot = await FirebaseFirestore.instance
        .collection("users")
        .where("uid", isEqualTo: userUid)
        .get();

    Object? user = userQuerySnapshot.docs[0].data();
    firstName = (user as Map<String, dynamic>)["firstName"];
    lastName = (user)["lastName"];
    email = (user)["email"];
  }

  Stream<QuerySnapshot> getUserStream() {
    String? userUid = FirebaseAuth.instance.currentUser?.uid;
    if (userUid == null) {
      return const Stream<QuerySnapshot>.empty();
    }

    return FirebaseFirestore.instance
        .collection("users")
        .where("uid", isEqualTo: userUid)
        .snapshots();
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle mainText =
        const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
    TextStyle subText =
        const TextStyle(fontSize: 18, fontWeight: FontWeight.w400);

    return Scaffold(
        appBar: AppBar(
          title: const Text("BEM-VINDO(A)"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.grey[700],
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: getUserStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            if (!snapshot.hasData) {
              return const Text('No data available');
            }

            return buildPadding(mainText, subText);
          },
        ));
  }

  buildPadding(TextStyle mainText, TextStyle subText) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(child: ProfileImage()),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Text('Renan Barboza', style: mainText),
                    Text('Rg: G0817F0-H', style: subText),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: HomePageButton(
                  text: 'PERFIL',
                  backgroundColor: Colors.white,
                  isOutline: true,
                  onTap: perfil,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: HomePageButton(
                  text: 'SAIR',
                  backgroundColor: Colors.red[400],
                  textColor: Colors.white,
                  isOutline: false,
                  onTap: logout,
                ),
              ),
            ],
          ),
          const Divider(height: 50, thickness: 1),
          const Text(
            "Escala",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(4),
            ),
            height: 400,
            width: double.infinity,
            child: CalendarCarousel(
              width: double.infinity,
              height: double.infinity,
              weekendTextStyle: const TextStyle(
                color: Colors.red,
              ),
              thisMonthDayBorderColor: Colors.grey,
              weekFormat: false,
              daysHaveCircularBorder: false,
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: HomePageButton(
                      onTap: folha,
                      text: "Folha de pagamento",
                      backgroundColor: Colors.black,
                      isOutline: true,
                      textColor: Colors.white,
                      borderColor: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 1,
                    child: HomePageButton(
                      onTap: relatorio,
                      text: "Relatorios",
                      backgroundColor: Colors.white,
                      isOutline: true,
                      textColor: Colors.black,
                      borderColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/images/gabs.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
