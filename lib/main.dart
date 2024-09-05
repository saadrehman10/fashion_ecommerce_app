import 'package:fashion_ecommerce_app/screens/welcome_screens/on_boarding_screen.dart';
import 'package:fashion_ecommerce_app/screens/welcome_screens/splash_screen.dart';
import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      routes: {
        '/onBoardingScreen': (context) => const OnBoardingScreen(),
      },
    );
  }
}
