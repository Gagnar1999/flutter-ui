import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui_flutter/LandingScreen.dart';
import 'package:ui_flutter/util/Constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: COLOR_WHITE,
            accentColor: COLOR_DARK_BLUE,
            textTheme: screenWidth < 500
                ? TEXT_THEME_SMALL
                : TEXT_THEME_DEFAULT,
            fontFamily: "Montserrat"),
        home: LandingScreen(),
    );
  }
}
