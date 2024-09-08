import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/images.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:fashion_ecommerce_app/widgets/text_highlited.dart';
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
              const SizedBox(height: 6),
              SizedBox(
                height: screenHeight * .45,
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(alignment: Alignment.bottomLeft, children: [
                        Container(
                          width: screenWidth / 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                            image: const DecorationImage(
                                image:
                                    AssetImage(AppImages.welcomeScreenImgOne),
                                fit: BoxFit.fill),
                          ),
                        ),
                        const Text(
                          '⁎',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 100,
                          ),
                        )
                      ]),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: screenWidth / 2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white,
                                image: const DecorationImage(
                                    image: AssetImage(
                                        AppImages.welcomeScreenImgTwo),
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          CircleAvatar(
                              radius: (screenWidth / 2) * .4,
                              backgroundColor: Colors.white,
                              backgroundImage: const AssetImage(
                                  AppImages.welcomeScreenImgThree)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              TextHighted(
                text: WelcomeScreenText.title,
                highlightColor: AppColors.secondary,
                textToHighlight: WelcomeScreenText.hightedWords,
                fontSize: 27,
                normalTextColor: AppColors.tertiary,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
              Text(
                WelcomeScreenText.subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textColorSubtitles,
                  fontSize: 20,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/onBoardingScreen');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: Text(
                        WelcomeScreenText.buttonText,
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
                  text: AppTexts.alreadyHaveAAcc,
                  style: TextStyle(
                    color: AppColors.tertiary,
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      text: ButtonText.singIn,
                      style: TextStyle(
                        color: AppColors.secondary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, '/SignInScreen');
                        },
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
