import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper/home/screen/provider/home_provider.dart';
import 'package:sky_scrapper/home/screen/view/intro_Screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => IntroProvider(),
      )
    ],
    builder: (context, child) => Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => IntroScreen(),
          },
        );
      },
    ),
  ));
}
