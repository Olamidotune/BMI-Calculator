import 'package:bmi_calculator/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'Screens/input_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
              DeviceType deviceType) =>
          MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Mulish',
            textTheme: TextTheme(
              headline1: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: ACTIVE_TAB_COLOR,
              ),
              headline2: TextStyle(
                fontSize: 18.sp,
                color: ACTIVE_TAB_COLOR,
                fontWeight: FontWeight.bold,
              ),
              bodyText2: TextStyle(
                fontSize: 10.3.sp,
                color: TEXT_COLOR,
              ),
              bodyText1: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: TEXT_COLOR,
              ),
            ),
            appBarTheme: AppBarTheme(
              color: Colors.grey.shade800,
              elevation: 0,
              iconTheme: const IconThemeData(
                color: Colors.black,
              ),
            ),
            scaffoldBackgroundColor: Colors.grey),
        home: const InputPage(),
      ),
    );
  }
}
