import 'package:bmi_calculator/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class IconItems extends StatelessWidget {
  final IconData genderIcon;
  final String gender;

  const IconItems({Key? key, required this.genderIcon, required this.gender})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          color: Colors.white,
          size: 55
          ,
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          gender,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
