import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_animation/onboarding_animation.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: OnBoardingAnimation(
          controller: PageController(initialPage: 1),
          pages: [
            _GetCardsContent(
              image: AppImages.onBoardingOne,
              cardContent:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            ),
            _GetCardsContent(
              image: AppImages.onBoardingOne,
              cardContent:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            ),
            _GetCardsContent(
              image: AppImages.onBoardingOne,
              cardContent:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            ),
          ],
          indicatorDotHeight: 7.0,
          indicatorDotWidth: 7.0,
          indicatorType: IndicatorType.expandingDots,
          indicatorPosition: IndicatorPosition.bottomCenter,
          indicatorSwapType: SwapType.normal,
          
        ),
      ),
    );
  }
}

class _GetCardsContent extends StatelessWidget {
  final String image, cardContent;

  const _GetCardsContent({
    required this.image,
    required this.cardContent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              child: Image.asset(image),
            ),
            Text(
              cardContent,
            ),
          ],
        ),
      ),
    );
  }
}
