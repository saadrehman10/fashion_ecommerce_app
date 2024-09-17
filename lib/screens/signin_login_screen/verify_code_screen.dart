import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/utils/texts.dart';
import 'package:fashion_ecommerce_app/widgets/text_highlited.dart';
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

  // Declare FocusNodes for each OTP field
  final FocusNode _otp1FocusNode = FocusNode();
  final FocusNode _otp2FocusNode = FocusNode();
  final FocusNode _otp3FocusNode = FocusNode();
  final FocusNode _otp4FocusNode = FocusNode();

  Future<void> _getEmail() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    _email = sp.getString('userEmail')!;
    setState(() {
      _isLoading = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _getEmail();
  }

  // Function to move focus to the next field
  void _moveToNextField(
      {required FocusNode currentFocus, required FocusNode nextFocus}) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
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
            const SizedBox(height: 80),
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 0, horizontal: screenWidth * .1),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: TextFormField(
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
          ],
        ),
      ),
    );
  }
}
