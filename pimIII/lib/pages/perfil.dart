import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});
  static String id = 'perfil';

  final rs = "InnovSoft";
  final cnpj = "123.456.789-00";
  final endereco =
      "R. Antônio Macedo, 505 - Parque São Jorge, São Paulo - SP, 03087-010";
  final nome = "Renan Barboza";
  final cpf = "123.456.789-00";
  final rg = "G0817F0-H";
  final dob = "01/01/1990";
  final estadoCivil = "Solteiro";
  final genero = "Masculino";
  final pis = "234.695744.12-89";
  final email = "renan@barboza.com";
  final telefone = "(11) 12345-6789";
  final competencia = "Consultor";
  final departamento = "TI";
  final dataDeAdmissao = "01/01/2018";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PERFIL"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[700],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: CupertinoColors.destructiveRed,
                          shape: BoxShape.circle,
                        ),
                        width: 80,
                        height: 80,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/gabs.jpg',
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InputDisplay(info: nome, label: "Nome"),
                            const SizedBox(height: 15),
                            InputDisplay(info: cpf, label: "Cpf"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  InputDisplay(info: rg, label: "RG"),
                  const SizedBox(height: 15),
                  InputDisplay(info: dob, label: "Data de Nascimento"),
                  const SizedBox(height: 15),
                  InputDisplay(info: estadoCivil, label: "Estado Civil"),
                  const SizedBox(height: 15),
                  const Divider(height: 30, thickness: 1),
                  InputDisplay(info: genero, label: "Genero"),
                  const SizedBox(height: 15),
                  InputDisplay(info: pis, label: "Pis"),
                  const SizedBox(height: 15),
                  InputDisplay(info: email, label: "Email"),
                  const SizedBox(height: 15),
                  InputDisplay(info: telefone, label: "Telefone"),
                  const SizedBox(height: 15),
                  InputDisplay(info: endereco, label: "Endereco"),
                  const SizedBox(height: 15),
                  InputDisplay(info: competencia, label: "Cargo"),
                  const SizedBox(height: 15),
                  InputDisplay(info: departamento, label: "Departamento"),
                  const SizedBox(height: 15),
                  InputDisplay(info: dataDeAdmissao, label: "Data de admissao"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InputDisplay extends StatelessWidget {
  const InputDisplay({super.key, this.label, this.info});

  final String? label;
  final String? info;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              label ?? "",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 3),
            Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(4)),
                child: Text(
                  info ?? "",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                )),
          ],
        ));
  }
}
