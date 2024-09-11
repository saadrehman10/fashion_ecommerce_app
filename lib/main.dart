import 'package:fashion_ecommerce_app/screens/home_screen/home_screen.dart';
import 'package:fashion_ecommerce_app/screens/signin_login_screen/signin.dart';
import 'package:flutter/material.dart';
import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/screens/welcome_screens/on_boarding_screen.dart';
import 'package:fashion_ecommerce_app/screens/welcome_screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.secondary),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      routes: {
        '/onBoardingScreen': (context) => OnBoardingScreen(),
        '/HomeScreen': (context) => const HomeScreen(),
        '/SignInScreen': (context) => const SignInScreen(),
      },
    );
  }
}


// const SplashScreen()