import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import '../widgets/colors.dart';
import '../widgets/itemitems.dart';
import '../widgets/reusable_card.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = INACTIVE_TAB_COLOR;
  Color femaleCardColor = INACTIVE_TAB_COLOR;

  void updateColor(int sex) {
    if (sex == 1) {
      if (maleCardColor == INACTIVE_TAB_COLOR) {
        maleCardColor = ACTIVE_TAB_COLOR;
        femaleCardColor= INACTIVE_TAB_COLOR;
      } else {
        maleCardColor = INACTIVE_TAB_COLOR;
      }
    }if(sex ==2){
      if (femaleCardColor== INACTIVE_TAB_COLOR){
        femaleCardColor= ACTIVE_TAB_COLOR;
        maleCardColor= INACTIVE_TAB_COLOR;
      }else{femaleCardColor=INACTIVE_TAB_COLOR;}
    }
  }

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
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              updateColor(1);
                            });
                          },
                          child: ReusableCard(
                            cardColor: maleCardColor,
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
                              updateColor(2);
                            });
                          },
                          child: ReusableCard(
                            cardColor: femaleCardColor,
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
                  const SizedBox(
                      width: double.infinity,
                      child: ReusableCard(cardColor: ACTIVE_TAB_COLOR)),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: ReusableCard(cardColor: ACTIVE_TAB_COLOR),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      const Expanded(
                        child: ReusableCard(cardColor: ACTIVE_TAB_COLOR),
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
