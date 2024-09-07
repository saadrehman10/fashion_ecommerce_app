import 'package:fashion_ecommerce_app/utils/images.dart';
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
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * .5,
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
            ],
          ),
        ),
      ),
    );
  }
}
