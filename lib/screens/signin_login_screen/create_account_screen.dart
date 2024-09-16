import 'package:fashion_ecommerce_app/screens/signin_login_screen/widget.dart';
import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/images.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:fashion_ecommerce_app/widgets/custom_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});
  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  bool _termAndConditionCheckBox = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void _singUpFunction({required String email}) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool temp = await sp.setString('userEmail', email);
    if (temp) {
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, '/VerifyCodeScreen');
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
          closeIconColor: Colors.white,
          showCloseIcon: true,
          content: Text(
            PopMessages.error,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    CreateAccountScreenText.createAccountTextTitle,
                    style: TextStyle(
                      color: AppColors.tertiary,
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(CreateAccountScreenText.createAccountWelcomeText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.textColorSubtitles,
                        fontSize: 20,
                      )),
                  const SizedBox(height: 80),
                  Form(
                    key: _formKey,
                    child: Column(children: [
                      CustomTextFromFelid(
                        controller: _nameController,
                        labelText: TextfieldText.nameHeading,
                        hintText: TextfieldText.nameHint,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return TextfieldText.nameValidationOne;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextFromFelid(
                        controller: _emailController,
                        labelText: TextfieldText.emailHeading,
                        hintText: TextfieldText.emailHint,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return TextfieldText.emailValidationOne;
                          }
                          if (!value.contains('@') || !value.contains('.')) {
                            return TextfieldText.emailValidationTwo;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            activeColor: AppColors.secondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            value: _termAndConditionCheckBox,
                            onChanged: (value) {
                              setState(() {
                                _termAndConditionCheckBox =
                                    !_termAndConditionCheckBox;
                              });
                            },
                          ),
                          RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                                text: CreateAccountScreenText.agreeWith,
                                style: TextStyle(
                                  color: AppColors.tertiary,
                                  fontSize: 13,
                                ),
                                children: [
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        debugPrint(
                                            'Terms and Agreement working');
                                      },
                                    text: CreateAccountScreenText
                                        .termsAndCondition,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: AppColors.secondary,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 0),
                                  backgroundColor: AppColors.secondary,
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    if (_termAndConditionCheckBox == false) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          duration: Duration(seconds: 2),
                                          backgroundColor: Colors.red,
                                          closeIconColor: Colors.white,
                                          showCloseIcon: true,
                                          content: Text(
                                            PopMessages.agreeWith,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      _singUpFunction(
                                          email: _emailController.text);
                                    }
                                  }
                                },
                                child: Text(
                                  ButtonText.singUp,
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 20,
                                  ),
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Text(
                        AppTexts.orSingUp,
                        style: TextStyle(
                          color: AppColors.textColorSubtitles,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 40),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OtherLoginIcon(svgPath: AppSvg.apple),
                          SizedBox(width: 20),
                          OtherLoginIcon(svgPath: AppSvg.facebook),
                          SizedBox(width: 20),
                          OtherLoginIcon(svgPath: AppSvg.google),
                        ],
                      ),
                      const SizedBox(height: 40),
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
                                  Navigator.pop(context);
                                },
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
