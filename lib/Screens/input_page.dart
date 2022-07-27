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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'BMI CALCULATOR',
            style: TextStyle(color: Colors.white),
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
                    height: 5.h,
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
                        Slider(
                            value: height.toDouble(),
                            max: 215,
                            min: 131,
                            activeColor: Colors.red,
                            inactiveColor: Colors.red.shade300,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            })
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ReusableCard(
                          onPressed: () {},
                          cardColor: activeTabColor,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Expanded(
                        child: ReusableCard(
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
        bottomNavigationBar: Container(
          color: Colors.red.shade300,
          height: 7.h,
          width: double.infinity,
          child: const Center(child: Text('CALCULATE YOUR BMI')),
        ));
  }
}
