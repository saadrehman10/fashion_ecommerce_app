import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:fashion_ecommerce_app/screens/welcome_screens/welcome_screen.dart';
import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      duration: const Duration(seconds: 2),
      backgroundColor: AppColors.primary,
      nextScreen: const WelcomeScreen(),
      childWidget: SizedBox(
        child: Image.asset(AppImages.appIcon),
      ),
    );
  }
}
