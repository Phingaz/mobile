import 'package:flutter/material.dart';
import 'package:pimiii/components/helperFunctions/functions.dart';
import 'package:pimiii/components/login_n_register.dart';
import 'package:pimiii/pages/demonstrativo.dart';

class Holerite extends StatefulWidget {
  const Holerite({super.key});
  static String id = 'holerite';

  @override
  State<Holerite> createState() => _HoleriteState();
}

class _HoleriteState extends State<Holerite> {
  final cpfController = TextEditingController();
  DateTime date = DateTime(2023, 10, 24);

  void consultar() async {
    Navigator.pushNamed(context, Demonstrativo.id);
  }

  void validateCpf() async {
    String cpf = cpfController.text;
    if (cpf.length != 11) {
      errorHandler(
          context, "Por favor digite um cpf valido sem tracos e pontos");
      return;
    }

    Navigator.pushNamed(context, Demonstrativo.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[700],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Selecione o periodo que deseja verificar:"),
                  SizedBox(height: 100, child: Container()),
                  Column(
                    children: [
                      Container(
                        color: Colors.grey.shade200,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: HomePageButton(
                                  backgroundColor: Colors.grey.shade200,
                                  textColor: Colors.black,
                                  text: "Selecione a data",
                                  onTap: () async {
                                    DateTime? newDate = await showDatePicker(
                                        context: context,
                                        initialDate: date,
                                        firstDate: DateTime(1990),
                                        lastDate: DateTime(2100));
                                    if (newDate == null) return;
                                    setState(() {
                                      date = newDate;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: 20, child: Container()),
                              Expanded(
                                flex: 1,
                                child: Text(
                                    '${date.year}/${date.month}/${date.day}'),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30, child: Container()),
                      TextField(
                        controller: cpfController,
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: "CPF",
                        ),
                      ),
                      SizedBox(height: 30, child: Container()),
                      Button(function: validateCpf, text: "CONSULTAR")
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
