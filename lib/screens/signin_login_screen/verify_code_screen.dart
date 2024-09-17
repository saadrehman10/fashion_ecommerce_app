import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:fashion_ecommerce_app/widgets/text_highlited.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _email;
  bool _isLoading = false;

  final FocusNode _otp1FocusNode = FocusNode();
  final FocusNode _otp2FocusNode = FocusNode();
  final FocusNode _otp3FocusNode = FocusNode();
  final FocusNode _otp4FocusNode = FocusNode();

  final TextEditingController _opt1Controller = TextEditingController();
  final TextEditingController _opt2Controller = TextEditingController();
  final TextEditingController _opt3Controller = TextEditingController();
  final TextEditingController _opt4Controller = TextEditingController();

  Future<void> _getEmail() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    _email = sp.getString('userEmail')!;
    setState(() {
      _isLoading = true;
    });
  }

  void _moveToNextField(
      {required FocusNode currentFocus, required FocusNode nextFocus}) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void _resendOtp() {}

  void _verifyOtp({
    required String opt1,
    required String opt2,
    required String opt3,
    required String opt4,
  }) {
    debugPrint(opt1 + opt2 + opt3 + opt4);
    Navigator.pushNamed(context, '/NewPasswordScreen');
  }

  @override
  void initState() {
    super.initState();
    _getEmail();
  }

  @override
  void dispose() {
    _otp1FocusNode.dispose();
    _otp2FocusNode.dispose();
    _otp3FocusNode.dispose();
    _otp4FocusNode.dispose();

    _opt1Controller.dispose();
    _opt2Controller.dispose();
    _opt3Controller.dispose();
    _opt4Controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    if (screenHeight < screenWidth) {
      screenWidth *= 4;
    }

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                CreateAccountScreenText.verifyCodeTitle,
                style: TextStyle(
                  color: AppColors.tertiary,
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              _isLoading
                  ? TextHighted(
                      text:
                          '${CreateAccountScreenText.verifyCodeWelcomeText} \n $_email',
                      fontSize: 17,
                      highlightColor: AppColors.secondary,
                      normalTextColor: AppColors.textColorSubtitles,
                      textToHighlight: [_email],
                      textAlign: TextAlign.center,
                    )
                  : const Text(''),
              const SizedBox(height: 70),
              Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 0, horizontal: screenWidth * .03),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: TextFormField(
                            controller: _opt1Controller,
                            focusNode: _otp1FocusNode,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            onChanged: (value) {
                              if (value.length == 1) {
                                _moveToNextField(
                                    currentFocus: _otp1FocusNode,
                                    nextFocus: _otp2FocusNode);
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: '-',
                              hintStyle: TextStyle(
                                color: AppColors.tertiary,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                  color: AppColors.textColorSubtitles
                                      .withOpacity(.20),
                                  width: 4,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: TextFormField(
                            controller: _opt2Controller,
                            focusNode: _otp2FocusNode,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            onChanged: (value) {
                              if (value.length == 1) {
                                _moveToNextField(
                                    currentFocus: _otp2FocusNode,
                                    nextFocus: _otp3FocusNode);
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: '-',
                              hintStyle: TextStyle(
                                color: AppColors.tertiary,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                  color: AppColors.textColorSubtitles
                                      .withOpacity(.20),
                                  width: 4,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: TextFormField(
                            controller: _opt3Controller,
                            focusNode: _otp3FocusNode,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            onChanged: (value) {
                              if (value.length == 1) {
                                _moveToNextField(
                                    currentFocus: _otp3FocusNode,
                                    nextFocus: _otp4FocusNode);
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: '-',
                              hintStyle: TextStyle(
                                color: AppColors.tertiary,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                  color: AppColors.textColorSubtitles
                                      .withOpacity(.20),
                                  width: 4,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: TextFormField(
                            controller: _opt4Controller,
                            focusNode: _otp4FocusNode,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            onChanged: (value) {
                              if (value.length == 1) {
                                _otp4FocusNode.unfocus();
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: '-',
                              hintStyle: TextStyle(
                                color: AppColors.tertiary,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                  color: AppColors.textColorSubtitles
                                      .withOpacity(.20),
                                  width: 4,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 70),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: CreateAccountScreenText.dontReceiveOtp,
                    style: TextStyle(
                      color: AppColors.textColorSubtitles,
                      fontSize: 13,
                    ),
                    children: [
                      TextSpan(
                        text: CreateAccountScreenText.resendCode,
                        style: TextStyle(
                            color: AppColors.secondary,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _resendOtp();
                          },
                      ),
                    ]),
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
                            _verifyOtp(
                                opt1: _opt1Controller.text,
                                opt2: _opt2Controller.text,
                                opt3: _opt3Controller.text,
                                opt4: _opt4Controller.text);
                          }
                        },
                        child: Text(
                          ButtonText.verify,
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
      ),
    );
  }
}
