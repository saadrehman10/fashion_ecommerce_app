import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/images.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: screenHeight * .4,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: screenWidth / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.black,
                          image: DecorationImage(
                              image: AssetImage(AppImages.welcomeScreenImgOne),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Container(
                              width: screenWidth / 2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.black,
                                image: DecorationImage(
                                    image: AssetImage(
                                        AppImages.welcomeScreenImgTwo),
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ),
                          Expanded(
                            child: CircleAvatar(
                                radius: screenWidth / 2,
                                backgroundColor: Colors.black,
                                backgroundImage: AssetImage(
                                    AppImages.welcomeScreenImgThree)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'The ',
                    style: TextStyle(
                      color: AppColors.tertiary,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: AppTexts.appName,
                        style: TextStyle(color: AppColors.secondary),
                      ),
                      TextSpan(
                        text: WelcomeScreenText.title,
                        style: TextStyle(color: AppColors.tertiary),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: Text(
                        'Let\'s Get Started',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              RichText(
                text: TextSpan(
                  text: AppTexts.dontHaveAAcc,
                  style: TextStyle(
                    color: AppColors.tertiary,
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      text: ' Sign Up',
                      style: TextStyle(
                        color: AppColors.secondary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
