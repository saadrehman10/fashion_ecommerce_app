import 'package:fashion_ecommerce_app/screens/signin_login_screen/widget.dart';
import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/images.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:fashion_ecommerce_app/widgets/custom_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  bool _obscureText = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _loginFunction() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setBool('login', true);
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Login Successful'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
    setState(() {
      Navigator.pushNamedAndRemoveUntil(
          context, '/HomeScreen', (route) => false);
    });
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
                    CreateAccountScreenText.createAccountText,
                    style: TextStyle(
                      color: AppColors.tertiary,
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(CreateAccountScreenText.welcomeText,
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
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!value.contains('@') || !value.contains('.')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextFromFelid(
                        controller: _passwordController,
                        obscureText: _obscureText,
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        keyboardType: TextInputType.visiblePassword,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: _obscureText
                              ? Icon(FontAwesomeIcons.eye,
                                  size: 15, color: AppColors.secondary)
                              : Icon(FontAwesomeIcons.eyeSlash,
                                  size: 15, color: AppColors.secondary),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
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
                                    _loginFunction();
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
                                  Navigator.pushNamed(context, '/SignInScreen');
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
