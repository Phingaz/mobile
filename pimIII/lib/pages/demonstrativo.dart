import 'package:flutter/material.dart';
import 'package:pimiii/components/login_n_register.dart';

class Demonstrativo extends StatelessWidget {
  const Demonstrativo({super.key});
  static String id = 'demonstrativo';

  final funcao = "Consultor";
  final datadepagamento = "18/12/2023";
  final desconstos = "R\$ 100";
  final salario = "R\$ 2,500";
  final rs = "InnovSoft";
  final cnpj = "123.456.789-00";
  final endereco =
      "R. da Cantareira, 306 - Centro Histórico de São Paulo, São Paulo - SP, 01024-900";
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
        title: const Text(
          "Demonstrativo de Pagamento Mensal",
          style: TextStyle(fontSize: 16),
        ),
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
                  InputDisplay(info: rs, label: "Razao Social"),
                  const SizedBox(height: 15),
                  InputDisplay(info: cnpj, label: "CNPJ"),
                  const SizedBox(height: 15),
                  InputDisplay(info: endereco, label: "Endereco"),
                  const SizedBox(height: 15),
                  const Divider(height: 30, thickness: 1),
                  InputDisplay(info: nome, label: "Nome"),
                  const SizedBox(height: 15),
                  InputDisplay(info: cpf, label: "CPF"),
                  const SizedBox(height: 15),
                  InputDisplay(info: dataDeAdmissao, label: "Data de Admissao"),
                  const SizedBox(height: 15),
                  InputDisplay(info: funcao, label: "Funcao"),
                  const SizedBox(height: 15),
                  InputDisplay(info: pis, label: "PIS"),
                  const SizedBox(height: 15),
                  const Divider(height: 30, thickness: 1),
                  InputDisplay(info: competencia, label: "Competencia"),
                  const SizedBox(height: 15),
                  InputDisplay(
                      info: datadepagamento, label: "Data de pagamento"),
                  const SizedBox(height: 15),
                  InputDisplay(info: desconstos, label: "Total de descontos"),
                  const SizedBox(height: 15),
                  InputDisplay(info: salario, label: "Liquido a receber"),
                  const SizedBox(height: 15),
                  Button(function: () {}, text: "Imprimir")
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
