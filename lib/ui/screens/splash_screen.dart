import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherly/ui/screens/home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _moveToNextScreen() async{
    await Future.delayed(const Duration(seconds: 2));
    Get.offAll(()=> const HomeScreen());
    // Get.offAll(()=> const WeatherHome());
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNextScreen();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            SizedBox(
              height: 250,
                child: Lottie.asset("assets/images/lotties/splash_screen_lottie.json")),
            Text('Weatherly',style: TextStyle(fontSize: 26,fontWeight: FontWeight.w500),),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(height: 16,),
            Text('version 1.1.0'),
            SizedBox(height: 26,),
          ],
        ),
      ),
    );
  }
}
