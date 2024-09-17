import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:flutter/material.dart';

class CompleteYourProfile extends StatefulWidget {
  const CompleteYourProfile({super.key});

  @override
  State<CompleteYourProfile> createState() => _CompleteYourProfileState();
}

class _CompleteYourProfileState extends State<CompleteYourProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  CreateAccountScreenText.completeYourProfileTitle,
                  style: TextStyle(
                    color: AppColors.tertiary,
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                Text(CreateAccountScreenText.completeYourProfileWelcomeText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textColorSubtitles,
                      fontSize: 20,
                    )),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ));
  }
}
