import 'package:bmi_calculator/Screens/result_page.dart';
import 'package:bmi_calculator/widgets/calculator_brain.dart';
import 'package:bmi_calculator/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:sizer/sizer.dart';
import '../widgets/itemitems.dart';
import '../widgets/reusable_card.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: labelTextStyle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        child: ReusableCard(
                          onPressed: () {},
                          cardColor: selectedGender == Gender.male
                              ? activeTabColor
                              : inactiveTabColor,
                          cardItems: const IconItems(
                              genderIcon: FontAwesomeIcons.mars,
                              gender: 'MALE'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        child: ReusableCard(
                          onPressed: () {},
                          cardColor: selectedGender == Gender.female
                              ? activeTabColor
                              : inactiveTabColor,
                          cardItems: const IconItems(
                            gender: 'FEMALE',
                            genderIcon: FontAwesomeIcons.venus,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                ReusableCard(
                  onPressed: () {},
                  cardColor: activeTabColor,
                  cardItems: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'HEIGHT',
                        style: labelTextStyle,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: largeLabelTextStyle,
                          ),
                          SizedBox(
                            width: 0.1.w,
                          ),
                          const Text(
                            'cm',
                            style: labelTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.red.shade300,
                          inactiveTrackColor: Colors.white,
                          thumbColor: Colors.red,
                          trackHeight: 3,
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 13),
                          overlayShape:
                              const RoundSliderOverlayShape(overlayRadius: 35),
                          overlayColor: Colors.pink.shade100.withAlpha(30),
                        ),
                        child: Slider(
                            value: height.toDouble(),
                            max: 215,
                            min: 131,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            }),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        cardItems: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'WEIGHT',
                              style: labelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: largeLabelTextStyle,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ActiveButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                  ),
                                  ActiveButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {},
                        cardColor: activeTabColor,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                      child: ReusableCard(
                        cardItems: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'AGE',
                              style: labelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: largeLabelTextStyle,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ActiveButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                  ),
                                  ActiveButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {},
                        cardColor: activeTabColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        child: Container(
          color: Colors.red.shade300,
          height: 7.h,
          width: double.infinity,
          child: Center(
            child: Text(
              'CALCULATE YOUR BMI',
              style: labelTextStyle.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        onTap: () {
          CalculatorBrain calc =
              CalculatorBrain(height: height, weight: weight);

          Navigator.push(
            context,
            MaterialPageRoute(
              // ignore: prefer_const_constructors
              builder: (context) => ResultPage(
                bmiResult: calc.calculateBMI(),
                resultText: calc.getResult(),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ActiveButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const ActiveButton({Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      fillColor: Colors.red.shade300,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
