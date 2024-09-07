import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/images.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
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
              title: TextHighted(
                text: OnBoardingScreenText.pageOneTitle,
                textToHighlight: const ['Shameless'],
                highlightColor: AppColors.secondary,
                fontSize: 30,
                normalTextColor: AppColors.tertiary,
              ),
              subtitle: OnBoardingScreenText.pageOneSubtitle,
              backButtonVisibility: false,
            ),
            _GetCardsContent(
              image: AppImages.onBoardingOne,
              title: TextHighted(
                text: OnBoardingScreenText.pageOneTitle,
                textToHighlight: const ['Shameless'],
                highlightColor: AppColors.secondary,
                fontSize: 30,
                normalTextColor: AppColors.tertiary,
              ),
              subtitle: OnBoardingScreenText.pageTwoSubtitle,
              backButtonVisibility: true,
            ),
            _GetCardsContent(
              image: AppImages.onBoardingOne,
              title: TextHighted(
                text: OnBoardingScreenText.pageOneTitle,
                textToHighlight: const ['Shameless'],
                highlightColor: AppColors.secondary,
                fontSize: 30,
                normalTextColor: AppColors.tertiary,
              ),
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
          indicatorJumpScale: 3,
        ),
      ),
    );
  }
}

class _GetCardsContent extends StatelessWidget {
  final String image, subtitle;
  final Widget title;
  final bool backButtonVisibility;

  const _GetCardsContent({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.backButtonVisibility,
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
                        backgroundColor: AppColors.secondary),
                    icon: Icon(Icons.arrow_back,
                        size: 40, color: AppColors.primary),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                      backgroundColor: AppColors.secondary),
                  icon: Icon(Icons.arrow_forward,
                      size: 40, color: AppColors.primary),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TextHighted extends StatelessWidget {
  final String text;
  final List<String> textToHighlight;
  final Color highlightColor;
  final Color normalTextColor;
  final double fontSize;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  TextHighted(
      {super.key,
      required this.text,
      required this.textToHighlight,
      required this.highlightColor,
      required this.fontSize,
      required this.normalTextColor,
      this.textAlign = TextAlign.left,
      this.fontWeight = FontWeight.normal}) {
    _listed();
  }

  // ignore: empty_constructor_bodies
  final List<String> _totalText = [];
  void _listed() => _totalText.addAll(text.split(' '));

  @override
  Widget build(BuildContext context) {
    debugPrint(_totalText.toString());
    return RichText(
        textAlign: textAlign!,
        text: TextSpan(
            children: List.generate(_totalText.length, (index) {
          if (textToHighlight.contains(_totalText[index])) {
            return TextSpan(
                text: '${_totalText[index]} ',
                style: TextStyle(
                  color: highlightColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ));
          } else {
            return TextSpan(
              text: '${_totalText[index]} ',
              style: TextStyle(
                color: normalTextColor,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            );
          }
        })));
  }
}
