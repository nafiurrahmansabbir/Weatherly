import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:weatherly/ui/screens/splash_screen.dart';

import 'ui/screens/home_screen.dart';

class Weatherly extends StatelessWidget {
  const Weatherly({super.key});

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    SystemChrome.setSystemUIOverlayStyle(
      brightness == Brightness.dark
          ? SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
      )
          : SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      themeMode: ThemeMode.system,
      theme: lightTheme,
      darkTheme: darkTheme,

    );

  }
}
final ThemeData lightTheme= ThemeData();
final ThemeData darkTheme = ThemeData();
