import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/home_screen.dart';
import 'weather_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WeatherController());

    Future.delayed(Duration(seconds: 2), () {
      Get.offAll(() => HomeScreen(), duration: Duration(seconds: 5));
    });
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/splash.png',
            height: 100,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Weather App',
            style: TextStyle(fontSize: 25, color: Colors.blue),
          )
        ],
      )),
    );
  }
}
