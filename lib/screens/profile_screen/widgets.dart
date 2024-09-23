import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:flutter/material.dart';

class CustomWidgets {
  static Future<bool?> customBottomModalSheet({
    required BuildContext context,
    required double screenWidth,
  }) {
    return showModalBottomSheet<bool>(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: screenWidth * .6,
          width: screenWidth,
          child: Column(
            children: [
              Text(
                ProfileScreenText.logout,
                style: TextStyle(
                  color: AppColors.tertiary,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.textColorSubtitles.withOpacity(.2)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                ProfileScreenText.confirmLogout,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textColorSubtitles,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: AppColors.background,
                      ),
                      child: Text(ButtonText.cancel,
                          style: TextStyle(
                            color: AppColors.secondary,
                            fontSize: 18,
                          )),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: AppColors.secondary,
                      ),
                      child: Text(ButtonText.logout,
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 18,
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
