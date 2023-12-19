import 'package:flutter/material.dart';
import 'package:pimiii/components/login_n_register.dart';

class MyTable extends StatelessWidget {
  static String id = 'tela_de_relatorios';

  const MyTable({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> data = [
      {
        "Data": "01/11",
        "Tipo": "Folga",
        "Descricao": "Feriado",
      },
      {
        "Data": "02/11",
        "Tipo": "Presente",
        "descricao": "",
      },
      {
        "Data": "03/11",
        "Tipo": "Presente",
        "descricao": "",
      },
      {
        "Data": "04/11",
        "Tipo": "Presente",
        "descricao": "",
      },
      {
        "Data": "05/11",
        "Tipo": "Falta",
        "descricao": "Atestado medico",
      },
      {
        "Data": "06/11",
        "Tipo": "Falta",
        "descricao": "Atestado medico",
      },
      {
        "Data": "07/11",
        "Tipo": "Presente",
        "descricao": "",
      },
      {
        "Data": "08/11",
        "Tipo": "Presente",
        "descricao": "",
      },
      {
        "Data": "09/11",
        "Tipo": "Presente",
        "descricao": "",
      },
      {
        "Data": "10/11",
        "Tipo": "Presente",
        "descricao": "",
      },
      {
        "Data": "11/11",
        "Tipo": "Presente",
        "descricao": "",
      },
      {
        "Data": "12/11",
        "Tipo": "Presente",
        "descricao": "",
      },
      {
        "Data": "13/11",
        "Tipo": "Presente",
        "descricao": "",
      },
    ];

    int faltaCount = data.where((map) => map["Tipo"] == "Falta").length;

    return Scaffold(
      appBar: AppBar(
        title: const Text("RELATORIOS"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[700],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(border: Border.all()),
                child: const Text(
                  "Relatorio de absenteismo",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              Table(
                defaultColumnWidth: const IntrinsicColumnWidth(),
                border: TableBorder.all(),
                children: [
                  TableRow(
                    children: data.first.keys.map((key) {
                      return TableCell(
                        child: Center(
                          child: Text(
                            key,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  ...data.map((map) {
                    return TableRow(
                      children: map.values.map((value) {
                        return TableCell(
                          child: Center(
                              child: Text(value,
                                  style: TextStyle(
                                      backgroundColor: value == "Falta"
                                          ? Colors.red[100]
                                          : value == "Presente"
                                              ? Colors.green[100]
                                              : value == "Folga"
                                                  ? Colors.blue[100]
                                                  : Colors.white,
                                      fontSize: 15,
                                      color: Colors.black))),
                        );
                      }).toList(),
                    );
                  }).toList(),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Text("Atrasos: $faltaCount",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 18)),
                ],
              ),
              const SizedBox(height: 20),
              Button(
                text: 'Voltar',
                function: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
