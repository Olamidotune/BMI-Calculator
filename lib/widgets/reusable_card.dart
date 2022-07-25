import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ReusableCard extends StatelessWidget {
  final Color cardColor;
  final Widget? cardItems;

  const ReusableCard({Key? key, required this.cardColor, this.cardItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: 44.w,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(
          33,
        ),
      ),
      child: cardItems,
    );
  }
}

