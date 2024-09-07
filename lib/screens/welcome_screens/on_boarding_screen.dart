import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/images.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:fashion_ecommerce_app/widgets/text_highlited.dart';
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
          controller: PageController(initialPage: 0),
          pages: [
            _GetCardsContent(
              image: AppImages.onBoardingOne,
              title: TextHighted(
                text: OnBoardingScreenText.pageOneTitle,
                textToHighlight: OnBoardingScreenText.titlePageOneHightedWords,
                highlightColor: AppColors.secondary,
                fontSize: 30,
                normalTextColor: AppColors.tertiary,
                textAlign: TextAlign.center,
              ),
              skipButtonVisibility: true,
              subtitle: OnBoardingScreenText.pageOneSubtitle,
              backButtonVisibility: false,
            ),
            _GetCardsContent(
              image: AppImages.onBoardingOne,
              title: TextHighted(
                text: OnBoardingScreenText.pageTwoTitle,
                textToHighlight: OnBoardingScreenText.titlePageTwoHightedWords,
                highlightColor: AppColors.secondary,
                fontSize: 30,
                normalTextColor: AppColors.tertiary,
                textAlign: TextAlign.center,
              ),
              skipButtonVisibility: true,
              subtitle: OnBoardingScreenText.pageTwoSubtitle,
              backButtonVisibility: true,
            ),
            _GetCardsContent(
              image: AppImages.onBoardingOne,
              title: TextHighted(
                text: OnBoardingScreenText.pageThreeTitle,
                textToHighlight:
                    OnBoardingScreenText.titlePageThreeHightedWords,
                highlightColor: AppColors.secondary,
                fontSize: 30,
                normalTextColor: AppColors.tertiary,
                textAlign: TextAlign.center,
              ),
              skipButtonVisibility: false,
              subtitle: OnBoardingScreenText.pageThreeSubtitle,
              backButtonVisibility: true,
            ),
          ],
          indicatorDotHeight: 7.0,
          indicatorDotWidth: 7.0,
          indicatorType: IndicatorType.jumpingDots,
          indicatorActiveDotColor: AppColors.secondary,
          indicatorActiveDotScale: 1.5,
          indicatorScale: 10,
          indicatorInActiveDotColor: AppColors.textColorSubtitles,
          indicatorPosition: IndicatorPosition.bottomCenter,
          indicatorSwapType: SwapType.zRotation,
          indicatorJumpScale: 1,
        ),
      ),
    );
  }
}

class _GetCardsContent extends StatelessWidget {
  final String image, subtitle;
  final Widget title;
  final bool backButtonVisibility;
  final bool skipButtonVisibility;

  const _GetCardsContent({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.backButtonVisibility,
    required this.skipButtonVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: skipButtonVisibility,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Skip',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              child: Image.asset(image),
            ),
            title,
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: AppColors.textColorSubtitles, fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                    visible: backButtonVisibility,
                    child: IconButton(
                      onPressed: () {},
                      style: IconButton.styleFrom(
                          padding: const EdgeInsets.all(15),
                          backgroundColor: AppColors.primary,
                          side: BorderSide(color: AppColors.secondary)),
                      icon: Icon(Icons.arrow_back,
                          size: 25, color: AppColors.secondary),
                    )),
                IconButton(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                      backgroundColor: AppColors.secondary),
                  icon: Icon(Icons.arrow_forward,
                      size: 25, color: AppColors.primary),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
