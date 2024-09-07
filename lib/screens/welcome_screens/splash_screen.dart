import 'package:fashion_ecommerce_app/screens/welcome_screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.white,
        nextScreen: const OnBoardingScreen(),
        childWidget: SizedBox(
          child: Image.asset('assets/images/splashScreenLogo.png'),
        ));
  }
}
