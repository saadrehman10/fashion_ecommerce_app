import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  Future<void> _getEmail() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String temp = sp.getString('userEmail')!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          Text(
            CreateAccountScreenText.verifyCodeTitle,
            style: TextStyle(
              color: AppColors.tertiary,
              fontSize: 40,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          Text('${CreateAccountScreenText.verifyCodeWelcomeText} ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textColorSubtitles,
                fontSize: 20,
              )),
          const SizedBox(height: 100),
        ]),
      ),
    );
  }
}
