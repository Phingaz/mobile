import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'result.dart';
import 'bmiFunction.dart';

const activeCardColor = Color(0xFF1D1E33);
const inActiveCardColor = Color(0xFF111328);
const bottomButtonHeight = 60.0;
const pinkish = Color(0xFFEB1555);
const tstyle = TextStyle(
    fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF81848D));
const tmain = TextStyle(fontSize: 40, fontWeight: FontWeight.bold);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? gender = Gender.male;
  int height = 180;
  int weight = 50;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BMI Calculator"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          gender = Gender.male;
                        });
                      },
                      child: ReusableCard(
                        color: gender == Gender.male
                            ? activeCardColor
                            : inActiveCardColor,
                        cardChild: const CardContent(
                          icon: FontAwesomeIcons.mars,
                          text: "Male",
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      color: gender == Gender.female
                          ? activeCardColor
                          : inActiveCardColor,
                      cardChild: const CardContent(
                        icon: FontAwesomeIcons.venus,
                        text: "Female",
                      ),
                    ),
                  )),
                ],
              ),
            ),
            Expanded(
                child: Row(children: [
              Expanded(
                  child: ReusableCard(
                color: const Color(0xFF1D1E33),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Height",
                      style: tstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: tmain),
                        const Text("cm")
                      ],
                    ),
                    Slider(
                        value: height.toDouble(),
                        min: 100.0,
                        max: 300.0,
                        activeColor: pinkish,
                        inactiveColor: inActiveCardColor,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        })
                  ],
                ),
              ))
            ])),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                    color: const Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Weight",
                          style: tstyle,
                        ),
                        Text(
                          weight.toString(),
                          style: tmain,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: Icons.remove,
                                function: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            const SizedBox(width: 10),
                            RoundIconButton(
                              icon: Icons.add,
                              function: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: ReusableCard(
                    color: const Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Age",
                          style: tstyle,
                        ),
                        Text(age.toString(), style: tmain),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: Icons.remove,
                                function: () {
                                  setState(() {
                                    age == 0 ? age : age--;
                                  });
                                }),
                            const SizedBox(width: 10),
                            RoundIconButton(
                                icon: Icons.add,
                                function: () {
                                  setState(() {
                                    age++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
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
                  Calculator result =
                      Calculator(height: height, weight: weight);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Result(
                        resultNumber: result.calculateBmi(),
                        resultText: result.getText(),
                        resultType: result.getResult(),
                      ),
                    ),
                  );
                },
                child: const Center(
                  child: Text(
                    "Calculate your bmi",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, required this.function, this.icon});
  final VoidCallback? function;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints.tightFor(width: 56, height: 56),
      onPressed: function,
      elevation: 6.0,
      shape: const CircleBorder(),
      fillColor: inActiveCardColor,
      child: Icon(icon),
    );
  }
}

class CardContent extends StatelessWidget {
  const CardContent({super.key, this.icon, this.text});

  final IconData? icon;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        const SizedBox(height: 20),
        Text(
          text ?? "",
          style: tstyle,
        ),
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  const ReusableCard({super.key, required this.color, this.cardChild});

  final Color? color;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: cardChild,
    );
  }
}
