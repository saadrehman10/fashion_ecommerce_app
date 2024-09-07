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
        child: Column(
          children: [
            Container(
              height: screenHeight * .7,
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 400,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.black,
                        image: DecorationImage(
                            image: AssetImage(AppImages.welcomeScreenImgOne),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Container(
                          height: 400,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.black,
                            image: DecorationImage(
                                image:
                                    AssetImage(AppImages.welcomeScreenImgOne),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage(AppImages.welcomeScreenImgOne)),
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
    );
  }
}
