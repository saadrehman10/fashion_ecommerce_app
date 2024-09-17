import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:fashion_ecommerce_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscureTextNewPassword = true;
  bool _obscureTextConfirmPassword = true;

  final RegExp uppercaseRegExp = RegExp(r'[A-Z]');
  final RegExp specialCharRegExp = RegExp(r'[!@#\$%^&*(),.?":{}|<>]');
  final RegExp numberRegExp = RegExp(r'\d');

  void _newPasswordFunction() {}

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                CreateAccountScreenText.newPasswordTitle,
                style: TextStyle(
                  color: AppColors.tertiary,
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              Text(CreateAccountScreenText.newPasswordWelcomeText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textColorSubtitles,
                    fontSize: 20,
                  )),
              const SizedBox(height: 80),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFromFelid(
                      controller: _newPasswordController,
                      obscureText: _obscureTextNewPassword,
                      labelText: TextfieldText.newPasswordHeading,
                      hintText: TextfieldText.newPasswordHint,
                      keyboardType: TextInputType.visiblePassword,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureTextNewPassword = !_obscureTextNewPassword;
                          });
                        },
                        icon: _obscureTextNewPassword
                            ? Icon(FontAwesomeIcons.eye,
                                size: 15, color: AppColors.secondary)
                            : Icon(FontAwesomeIcons.eyeSlash,
                                size: 15, color: AppColors.secondary),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return TextfieldText.newPasswordValidationOne;
                        } else {
                          if (value.length < 8) {
                            return TextfieldText.newPasswordValidationTwo;
                          }
                          if (!uppercaseRegExp.hasMatch(value)) {
                            return TextfieldText.newPasswordValidationThree;
                          }
                          if (!numberRegExp.hasMatch(value)) {
                            return TextfieldText.newPasswordValidationFour;
                          }
                          if (!specialCharRegExp.hasMatch(value)) {
                            return TextfieldText.newPasswordValidationFive;
                          }
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextFromFelid(
                      controller: _confirmPasswordController,
                      obscureText: _obscureTextConfirmPassword,
                      labelText: TextfieldText.confirmPasswordHeading,
                      hintText: TextfieldText.confirmPasswordHint,
                      keyboardType: TextInputType.visiblePassword,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureTextConfirmPassword =
                                !_obscureTextConfirmPassword;
                          });
                        },
                        icon: _obscureTextConfirmPassword
                            ? Icon(FontAwesomeIcons.eye,
                                size: 15, color: AppColors.secondary)
                            : Icon(FontAwesomeIcons.eyeSlash,
                                size: 15, color: AppColors.secondary),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return TextfieldText.confirmPasswordValidationOne;
                        }
                        if (_newPasswordController.text != value) {
                          return TextfieldText.confirmPasswordValidationTwo;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 40),
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
                                  _newPasswordFunction();
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
