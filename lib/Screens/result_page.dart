import 'package:bmi_calculator/widgets/constants.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

// ignore: constant_identifier_names
enum WeightResult { UNDERWEIGHT, NORMAL, OVERWEIGHT }

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;

  // ignore: use_key_in_widget_constructors
  const ResultPage({required this.bmiResult, required this.resultText});

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
        child: Container(
          color: Colors.grey.shade800,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Your Result',
                      style: largeLabelTextStyle.copyWith(fontSize: 40),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Expanded(
                  flex: 5,
                  child: ReusableCard(
                    onPressed: () {},
                    cardColor: activeTabColor,
                    cardItems: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          resultText.toUpperCase(),
                          style: largeLabelTextStyle.copyWith(
                            color: Colors.green.shade300,
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          bmiResult.toUpperCase(),
                          style: largeLabelTextStyle.copyWith(
                              color: Colors.white, fontSize: 80),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          'Normal BMI range:',
                          style: labelTextStyle.copyWith(
                            color: Colors.grey.shade500,
                          ),
                        ),
                        Text(
                          '18.5 - 25 kg/m2',
                          style: labelTextStyle.copyWith(),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                      ],
                    ),
                  ),
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
              'RE-CALCULATE YOUR BMI',
              style: labelTextStyle.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
