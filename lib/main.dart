import 'package:fashion_ecommerce_app/screens/layout_page/layout_page.dart';
import 'package:fashion_ecommerce_app/screens/signin_login_screen/complete_your_profile.dart';
import 'package:fashion_ecommerce_app/screens/signin_login_screen/create_account_screen.dart';
import 'package:fashion_ecommerce_app/screens/signin_login_screen/new_passwrod.dart';

import 'package:fashion_ecommerce_app/screens/signin_login_screen/signin_screen.dart';
import 'package:fashion_ecommerce_app/screens/signin_login_screen/verify_code_screen.dart';
import 'package:fashion_ecommerce_app/screens/welcome_screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/screens/welcome_screens/on_boarding_screen.dart';

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
      home: const LayoutPage(),
      routes: {
        '/onBoardingScreen': (context) => OnBoardingScreen(),
        '/LayoutPage': (context) => const LayoutPage(),
        '/SignInScreen': (context) => const SignInScreen(),
        '/CreateAccountScreen': (context) => const CreateAccountScreen(),
        '/VerifyCodeScreen': (context) => const VerifyCodeScreen(),
        '/NewPasswordScreen': (context) => const NewPasswordScreen(),
        '/CompleteYourProfile': (context) => const CompleteYourProfile(),
      },
    );
  }
}


// const SplashScreen()