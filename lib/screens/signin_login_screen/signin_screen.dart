import 'package:fashion_ecommerce_app/business_logics/login_logic.dart';
import 'package:fashion_ecommerce_app/screens/signin_login_screen/widget.dart';
import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/images.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:fashion_ecommerce_app/widgets/custom_textfield.dart';
import 'package:fashion_ecommerce_app/widgets/flutter_toast.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _loginFunction({required String email, required String password}) async {
    bool loginStatus =
        await LoginValidation.validateUser(email: email, password: password);

    if (loginStatus) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          showCloseIcon: true,
          closeIconColor: Colors.white,
          content: Text(PopMessages.loginSuccessful),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pushNamedAndRemoveUntil(
          // ignore: use_build_context_synchronously
          context,
          '/LayoutPage',
          (route) => false);
    } else {
      FlutterToast.showToast(message: PopMessages.loginFailed);
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
                    AppTexts.singIn,
                    style: TextStyle(
                      color: AppColors.tertiary,
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(SignInScreenText.welcomeText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.textColorSubtitles,
                        fontSize: 20,
                      )),
                  const SizedBox(height: 100),
                  Form(
                    key: _formKey,
                    child: Column(children: [
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
                      const SizedBox(height: 20),
                      CustomTextFromFelid(
                        controller: _passwordController,
                        obscureText: _obscureText,
                        labelText: TextfieldText.passwordHeading,
                        hintText: TextfieldText.passwordHint,
                        keyboardType: TextInputType.visiblePassword,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: _obscureText
                              ? Icon(Iconsax.eye,
                                  size: 23, color: AppColors.secondary)
                              : Icon(Iconsax.eye_slash,
                                  size: 23, color: AppColors.secondary),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return TextfieldText.passwordValidationOne;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  debugPrint('Forget pass working');
                                },
                              text: SignInScreenText.forgetPassword,
                              style: TextStyle(
                                  fontSize: 13, color: AppColors.secondary),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
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
                                    _loginFunction(
                                        email: _emailController.text,
                                        password: _passwordController.text);
                                  }
                                },
                                child: Text(
                                  ButtonText.singIn,
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
                        AppTexts.orSingIn,
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
                          text: AppTexts.dontHaveAAcc,
                          style: TextStyle(
                            color: AppColors.tertiary,
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                              text: ButtonText.singUp,
                              style: TextStyle(
                                color: AppColors.secondary,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(
                                      context, '/CreateAccountScreen');
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
