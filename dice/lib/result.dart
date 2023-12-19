import 'package:flutter/material.dart';

const activeCardColor = Color(0xFF1D1E33);
const inActiveCardColor = Color(0xFF111328);
const bottomButtonHeight = 60.0;
const pinkish = Color(0xFFEB1555);
const tstyle = TextStyle(
    fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF81848D));
const tmain = TextStyle(fontSize: 40, fontWeight: FontWeight.bold);

class Result extends StatelessWidget {
  const Result(
      {super.key,
      required this.resultNumber,
      required this.resultText,
      required this.resultType});

  final String resultNumber;
  final String resultText;
  final String resultType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Result"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Text(
                  "Your Result",
                  style: tmain,
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: inActiveCardColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  resultType,
                  style: const TextStyle(
                      color: Colors.green,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  resultNumber,
                  style: const TextStyle(
                      fontSize: 100, fontWeight: FontWeight.bold),
                ),
                Text(resultText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color(0xFF81848D),
                    ))
              ],
            ),
          )),
          Container(
            margin: const EdgeInsets.all(10),
            width: double.infinity,
            height: bottomButtonHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: pinkish,
            ),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Center(
                child: Text(
                  "Re-Calculate",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
