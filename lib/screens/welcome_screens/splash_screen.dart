import 'package:fashion_ecommerce_app/business_logics/app_open_logic.dart';
import 'package:fashion_ecommerce_app/screens/layout_page/layout_page.dart';
import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:fashion_ecommerce_app/screens/welcome_screens/welcome_screen.dart';
import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late bool _nextScreenStatus;
  bool _isLoading = false;

  Future<void> _checkOpen() async {
    _nextScreenStatus = await AppOpenLogic.checkAppStatus();
    await AppOpenLogic.setAppStatus(true);
    setState(() {
      _isLoading = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _checkOpen();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? FlutterSplashScreen.fadeIn(
            duration: const Duration(seconds: 2),
            backgroundColor: AppColors.primary,
            nextScreen:
                _nextScreenStatus ? const WelcomeScreen() : const LayoutPage(),
            childWidget: SizedBox(
              child: Image.asset(AppImages.appIcon),
            ),
          )
        : const Text('');
  }
}
